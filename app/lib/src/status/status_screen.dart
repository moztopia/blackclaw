import 'dart:async';

import 'package:flutter/material.dart';

import 'status_source.dart';

enum _StatusPhase { loading, success, error }

class StatusScreen extends StatefulWidget {
  const StatusScreen({
    required this.statusSource,
    required this.apiBaseUrl,
    super.key,
  });

  final StatusSource statusSource;
  final String apiBaseUrl;

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  _StatusPhase _phase = _StatusPhase.loading;
  ApiStatus? _status;

  @override
  void initState() {
    super.initState();
    unawaited(_loadStatus());
  }

  Future<void> _loadStatus() async {
    setState(() {
      _phase = _StatusPhase.loading;
      _status = null;
    });

    try {
      final status = await widget.statusSource.fetchStatus();
      if (!mounted) return;

      setState(() {
        _phase = _StatusPhase.success;
        _status = status;
      });
    } on Object {
      if (!mounted) return;

      setState(() {
        _phase = _StatusPhase.error;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Icon(
                      Icons.favorite_rounded,
                      color: Theme.of(context).colorScheme.primary,
                      size: 42,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Scaffold',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Your mobile app scaffold is ready.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: _buildStatus(context),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.apiBaseUrl,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatus(BuildContext context) {
    return switch (_phase) {
      _StatusPhase.loading => const Column(
        key: ValueKey('loading'),
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Checking API connection…'),
        ],
      ),
      _StatusPhase.success => Column(
        key: const ValueKey('success'),
        children: [
          Icon(
            Icons.check_circle_rounded,
            color: Theme.of(context).colorScheme.primary,
            size: 42,
          ),
          const SizedBox(height: 12),
          Text('API is online', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 6),
          Text('${_status!.service} · ${_status!.status}'),
        ],
      ),
      _StatusPhase.error => Column(
        key: const ValueKey('error'),
        children: [
          Icon(
            Icons.cloud_off_rounded,
            color: Theme.of(context).colorScheme.error,
            size: 42,
          ),
          const SizedBox(height: 12),
          Text(
            'Couldn’t reach the API',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 6),
          const Text(
            'Make sure the API is running and API_BASE_URL is correct.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: _loadStatus,
            icon: const Icon(Icons.refresh_rounded),
            label: const Text('Retry'),
          ),
        ],
      ),
    };
  }
}
