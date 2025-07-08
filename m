Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12875C8303C
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 21:12:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uZFKQ-0003iP-Uq; Tue, 08 Jul 2025 16:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uZETm-0000h1-On
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 15:59:55 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uZETi-000323-Kp
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 15:59:48 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a6d77b43c9so4364337f8f.3
 for <qemu-riscv@nongnu.org>; Tue, 08 Jul 2025 12:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752004781; x=1752609581; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=63P8ppJ+kbnHkeSkX/5RwU01yDhFPuboIXCeZwWOVTc=;
 b=cwNLwlImTgUonPgUifHq7t60xtbP9y09NWbPQpRdYXoejW3JqZta3NA2Vy12ZchOoA
 N47vCLhhDxpTnLTMkcG3OcQpjaNf+S3x6I/2yNcrW6JX0B9MRXwLzSsjW7qycIXMmpNg
 EpJBCayDlRSMFEn7PHbjLVRXbwmVuMGHafRilVPrlizoA/TrTUjseXMgOBD9iRzKW8r8
 EB5xEJnY4cMtz5lRgWR9WGloKwr4wtpGz/EI/+WN5bKDF8/VXwbUKS6yctV4q6St98Qq
 G239T2YBt4sLIUJfC5a2nMfCzu8MSMyT8/M3BP7N9qHGZvLbzlRe4sjV1FmX+MTw7tTc
 Bb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752004781; x=1752609581;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=63P8ppJ+kbnHkeSkX/5RwU01yDhFPuboIXCeZwWOVTc=;
 b=C9QchtoYbo6M8on8Y9xDeLBFgRwExHrABF8yWhcNpdS+5B+QK5pJ/qqlRN4TSYyFEv
 u6vO4kkas4JwfVN/JlLBMpWQGlDBU9DPcoE8ajerMwl25pmNQbDy3AdRw8G/+hsHvbGR
 NblZs1Xjevkx3cVdtt8nhxu1b45v10pyvmtc5PbuSZFd1BdFa7w5A5+WTEYJKrKj4W+8
 MZ4odVULeUllewkEjg6oZLtuC+FefqoFaOZC4HBCLjJFvI7YeFgaXO1P0Msw1p7rEjrm
 Ci0eFz4LH6w7Dg0hLZzqFympUq/EjO5PsXe8BHBII0/QiuqtIdif0dKsF7scSp7i3vzl
 JIvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKXbGdGq5DO66rR394zgGhq1KdIRhbQ3dsotfOcOWf5/aswyX6gpraF0rJ6y/tCIih8EF6UsT9rKiL@nongnu.org
X-Gm-Message-State: AOJu0YxOTa4JwRpUfMHNdZC+WPYrLkh42i9Oht0x8IMVp3FyRxrmelYz
 SX+sTni4UscAZb4KEUy56/vYkwJ90P4w0Lqshg8AOkY0r90sOU6MrNbOZANy0vmAq3lwibwcHjE
 hfESE6Gc=
X-Gm-Gg: ASbGncuibGHeW4IgK5rSpTi5KF45L5qCe8kAn2XG9A8WNkdBjD9aAaB12t7G9+rxC0+
 tT/Qr7pAbJwwvVMEXCOtHl1DGeqN2C42jU1YLwvN6yqlV9xbdNgHiByEhkZNOtwoFt7fsnq6Xnj
 fHrFesCZoUTLPwpZy5iIfn7fpaYLledToltJbGgh34BZx90YMWxGJUmR9lpEGwD4lO953i/DAnV
 56ZOTGBm8gxcKy2CAWYr1SszXXGBa59TMZTk0aQqTxwF22thzpAgWAT/QO9tjy99sHDlKCQLiu0
 R8YAGYEcLmdcXrV3m2NT+sbHMc9S7WYV8g/JY5mi3gaRFj+I2gJSmfTKGP9Ux2A=
X-Google-Smtp-Source: AGHT+IHwacqghYqg0I7/CIVSaLePxtGwNUsdjSbZU1XKr86Yx/rN1gYt8dxJGSCHKqQ+MWG7QFgmew==
X-Received: by 2002:a05:6000:144b:b0:3b2:fe84:a10 with SMTP id
 ffacd0b85a97d-3b4964c5ba2mr12853254f8f.0.1751969713232; 
 Tue, 08 Jul 2025 03:15:13 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cd4938ffsm17223585e9.21.2025.07.08.03.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 03:15:11 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id D8C645F88F;
 Tue, 08 Jul 2025 11:15:02 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org,  qemu-arm@nongnu.org,  Pierrick Bouvier
 <pierrick.bouvier@linaro.org>,  qemu-block@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>,  qemu-ppc@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>,  qemu-riscv@nongnu.org
Subject: Re: [RFC PATCH-for-10.1 v6 00/14] target-info: Add more API for
 VirtIO cleanups & introduce ARM macros
In-Reply-To: <20250707135403-mutt-send-email-mst@kernel.org> (Michael S.
 Tsirkin's message of "Mon, 7 Jul 2025 13:55:20 -0400")
References: <20250707172009.3884-1-philmd@linaro.org>
 <20250707135403-mutt-send-email-mst@kernel.org>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Tue, 08 Jul 2025 11:15:02 +0100
Message-ID: <87frf7ugyh.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Mon, Jul 07, 2025 at 07:19:54PM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
>> Rather than re-spinning the whole "single-binary: Make hw/arm/
>> common" series, restrict to the API additions, but include
>> examples of their usefulness (hundreds of virtio objects
>> removed from default Linux build).
>> Time passed since I context-switched out of this work so I'm
>> not sure the DEFINE_MACHINE_WITH_INTERFACES() implementation
>> is in the form Zoltan asked.
>
> I think I'd prefer to defer cleanups to post 10.1 - already
> too much on my plate as I was out sick. Unless there's a reason
> I'm missing to rush this in? Is there a feature we want in
> 10.1 that depends on it?

This is all part of reducing the number of duplicate builds of device
models which after the stubs VirtIO is the main remaining sub-system due
for clean-up:

  =E2=9E=9C  ./.gitlab-ci.d/check-units.py ./builds/system/compile_commands=
.json -n 80
  Total source files: 3595
  Total build units: 5658
  Most rebuilt units:
    ../../dump/win_dump.c built 29 times
    ../../cpu-target.c built 29 times
    ../../system/arch_init.c built 29 times
    ../../system/globals-target.c built 29 times
    ../../page-target.c built 29 times
    ../../page-vary-target.c built 29 times
    ../../target-info-stub.c built 29 times
    ../../migration/ram.c built 29 times
    ../../migration/target.c built 29 times
    ../../monitor/hmp-cmds-target.c built 29 times
    ../../monitor/hmp-target.c built 29 times
    ../../accel/accel-target.c built 29 times
    ../../accel/stubs/hvf-stub.c built 29 times
    ../../accel/stubs/nvmm-stub.c built 29 times
    ../../accel/stubs/whpx-stub.c built 29 times
    ../../accel/qtest/qtest.c built 29 times
    ../../system/main.c built 29 times
    ../../hw/i386/kvm/xen-stubs.c built 27 times
    ../../accel/stubs/xen-stub.c built 27 times
    ../../accel/stubs/kvm-stub.c built 27 times
    ../../hw/9pfs/virtio-9p-device.c built 23 times
    ../../hw/block/virtio-blk.c built 23 times
    ../../hw/block/virtio-blk-common.c built 23 times
    ../../hw/char/virtio-serial-bus.c built 23 times
    ../../hw/net/virtio-net.c built 23 times
    ../../hw/scsi/virtio-scsi.c built 23 times
    ../../hw/scsi/vhost-scsi-common.c built 23 times
    ../../hw/virtio/virtio.c built 23 times
    ../../hw/virtio/virtio-config-io.c built 23 times
    ../../hw/virtio/virtio-qmp.c built 23 times
    ../../hw/virtio/vhost-backend.c built 23 times
    ../../hw/virtio/vhost-iova-tree.c built 23 times
    ../../hw/virtio/vhost-user.c built 23 times
    ../../hw/virtio/vhost-shadow-virtqueue.c built 23 times
    ../../hw/virtio/virtio-balloon.c built 23 times
    ../../hw/virtio/vhost-user-fs.c built 23 times
    ../../hw/virtio/vhost-vsock.c built 23 times
    ../../hw/virtio/vhost-user-vsock.c built 23 times
    ../../hw/virtio/virtio-rng.c built 23 times
    ../../hw/block/vhost-user-blk.c built 22 times
    ../../hw/vfio/listener.c built 22 times
    ../../hw/vfio/container-base.c built 22 times
    ../../hw/vfio/container.c built 22 times
    ../../hw/vfio/helpers.c built 22 times
    ../../hw/vfio/pci-quirks.c built 22 times
    ../../hw/vfio/pci.c built 22 times
    ../../hw/virtio/vhost-vsock-pci.c built 22 times
    ../../hw/virtio/vhost-user-vsock-pci.c built 22 times
    ../../hw/virtio/vhost-user-blk-pci.c built 22 times
    ../../hw/virtio/vhost-user-scsi-pci.c built 22 times
    ../../hw/virtio/vhost-scsi-pci.c built 22 times
    ../../hw/virtio/vhost-user-fs-pci.c built 22 times
    ../../hw/virtio/virtio-crypto-pci.c built 22 times
    ../../hw/virtio/virtio-input-host-pci.c built 22 times
    ../../hw/virtio/virtio-input-pci.c built 22 times
    ../../hw/virtio/virtio-rng-pci.c built 22 times
    ../../hw/virtio/virtio-balloon-pci.c built 22 times
    ../../hw/virtio/virtio-9p-pci.c built 22 times
    ../../hw/virtio/virtio-scsi-pci.c built 22 times
    ../../hw/virtio/virtio-blk-pci.c built 22 times
    ../../hw/virtio/virtio-net-pci.c built 22 times
    ../../hw/virtio/virtio-serial-pci.c built 22 times
    ../../hw/virtio/virtio-iommu-pci.c built 22 times
    ../../hw/virtio/vdpa-dev-pci.c built 22 times
    ../../tests/unit/iothread.c built 16 times
    ../../hw/nvram/fw_cfg-acpi.c built 13 times
    ../../semihosting/guestfd.c built 11 times
    ../../semihosting/syscalls.c built 11 times
    ../../tests/qtest/tpm-emu.c built 8 times
    ../../hw/vfio/platform.c built 7 times
    ../../tests/qtest/tpm-util.c built 7 times
    ../../tests/qtest/tpm-tests.c built 7 times
    ../../hw/virtio/virtio-mem.c built 5 times
    ../../hw/virtio/virtio-mem-pci.c built 5 times
    ../../hw/virtio/virtio-md-pci.c built 5 times
    ../../tests/unit/socket-helpers.c built 5 times
    ../../tests/unit/io-channel-helpers.c built 5 times
    ../../fpu/softfloat.c built 4 times
    ../../semihosting/arm-compat-semi.c built 4 times
    ../../target/mips/system/addr.c built 4 times

Aside from reducing build times and overall load on the CI systems its
required to advance the single-binary QEMU build and get us closer to
being able to do proper heterogeneous emulation.

I don't think missing 10.1 would be critical for the single binary proof
of concept but obviously as with all changes that touch the whole code
base the longer the review takes the more time they spend in re-base
hell.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

