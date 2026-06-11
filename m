Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0A0CD8CB9
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 06:40:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXZ5E-00051w-LZ; Thu, 11 Jun 2026 02:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.liu.zevorn@gmail.com>)
 id 1wXZ57-0004xy-8v
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 02:40:02 -0400
Received: from mail-dl1-x1242.google.com ([2607:f8b0:4864:20::1242])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chao.liu.zevorn@gmail.com>)
 id 1wXZ55-0003X4-Ba
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 02:40:01 -0400
Received: by mail-dl1-x1242.google.com with SMTP id
 a92af1059eb24-137eb0d76beso417830c88.0
 for <qemu-riscv@nongnu.org>; Wed, 10 Jun 2026 23:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781159997; x=1781764797; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TR5Yj+jnC+eI/ZZxaHf3fwGoW6DrtKmYIMhR0sP7/ww=;
 b=rp+kPTYjJRaNTzMmDmlg5g8Z7PvOhViHHngK1JZCv5PzvNQsiWZi3lEe7rC3JIm/0u
 UoxX6Sbx+axUA5MToJZH+3+5tibOS/6CeRDrja+cw7M7GLVEZJdlZZlt+HZfEeFt8wnn
 nbtzsXMLzWSa5RWBjLz65OBkJHJc/5vgZnn1s03cgi7K9OkPUm8D4GhhRDM9QqKjeIQo
 WefJ4DYYRwnHtgTdXJ9f0iFL//giRfJKMS69GIv+N+BeydXD4OvQml0fWtV9jZFqCzqL
 T77XiDKEtauH7jwACr2GHpVXoyd3Z6ran+wucXzA8X2O8DcNvLRXDHNOOGw5H7qpvjs4
 ajQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781159997; x=1781764797;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TR5Yj+jnC+eI/ZZxaHf3fwGoW6DrtKmYIMhR0sP7/ww=;
 b=NKyKZWZRJFzAhdp0KGY+7e7DNRMvY8I7m4MgMIgy86JNxqBcn3X0suJCA7qnLsXDEm
 nk00Y+h67p6F5kbgIGoKIMti+1j8BPh0NV/w03bbB9foAlO7bws/KIBNYEM2pFXhNW54
 4S+1v4nZDuTi2WE2AhmlAAiG3jOEJqPsq1gnuyZBQ95kbtWzNGaIsRAM0bu4hMHvOr2W
 TDOGz6pwaiYCX77Gvb1Oko5bd51Xfa3i57brXO54DA3mn9gsd831AuL6eOYHqDWShoOA
 v7VCFWYlywUCQ2cGxXbbM7IQGcj5QX/+aB+GLpaPIn96t7/2fwAnmbu3Fnabu4OgVu+J
 6sXA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+3Lsn6IDEWIvuszYOYwffUbK3oC7OS+6akfAla4ytJM6lYlrRkUFLebNAXjDmtCz8p/opuJJipskyo@nongnu.org
X-Gm-Message-State: AOJu0Yx3zhbjL7gxeZwCxbNrjgV3gmVUVA03OWtyNi4FeNY5lGfyjtme
 YFDEkN4hRw9w9v+fXhhq3du9bd7gqKrXaw1FUS6OlxeTRBIlUnZC/kwk
X-Gm-Gg: Acq92OHgaFGfMD96a3GKCHFzB0FjEiHJC8qbYoa3OOhQNC9wPGJJ57yIsbWJyUN1rqO
 9PG7mwq2UTgymMBYcp/ZZyyoFLXtsuPK/cbfKgCYezvaIh8bXtjIKLaj53sD/z0KL1OQ0KI21Z7
 7SZ5FmpxavEUt0cRXYMQqK3I0Pt4dGaJf6FuptZFSloO6HioIllvKVa5/X1DaJn6tMkV8MFQ7uD
 bvjHFTqbAyCBkL8yhbVbGlnRQcCgi4NFm+qL2buUWMJNEERCFxA8Wm062dqthgxX7YeXaK9cdz5
 6K3RzZUzHHSFJHxPApwcuebenDC+Sy3V5K1fLelOHmNU2nTGG2Y2xEIsOi5foFKFwynyAd5iXmk
 UBgGnk9UkuUTnP77+TCU64+EEaBrZetVA6cAcTk2sSsgAeJAOASjShHDE3w2wBuMMxFfE2+RDqd
 g0bTgZoAroNaWXPCkDgGETDybUEzgTKWTWvCWKBaVe6jKlj3XuQEtbuFelYdZy9Csx7ClL8w==
X-Received: by 2002:a05:7022:798:b0:135:e781:74af with SMTP id
 a92af1059eb24-138430725d3mr918450c88.18.1781159997272; 
 Wed, 10 Jun 2026 23:39:57 -0700 (PDT)
Received: from localhost ([64.186.250.142]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13842ed1ccdsm935060c88.0.2026.06.10.23.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 23:39:56 -0700 (PDT)
Date: Thu, 11 Jun 2026 14:39:53 +0800
From: Chao Liu <chao.liu.zevorn@gmail.com>
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 andrew.jones@oss.qualcomm.com, 
 leif.lindholm@oss.qualcomm.com, uwu@icenowy.me,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v8 4/7] tests/functional/riscv64: add riscv-server-ref
 tests
Message-ID: <aipYH_C3poIESMok@ChaodeMacBook-Pro.local>
References: <20260610214133.1882563-1-daniel.barboza@oss.qualcomm.com>
 <20260610214133.1882563-5-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610214133.1882563-5-daniel.barboza@oss.qualcomm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1242;
 envelope-from=chao.liu.zevorn@gmail.com; helo=mail-dl1-x1242.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, Jun 10, 2026 at 06:41:30PM +0800, Daniel Henrique Barboza wrote:
> Add two tests for the recently added riscv-server-ref machine:
> 
> - a new test_opensbi.py test.  The idea is to have a quick test that can
> catch trivial regressions that would prevent OpenSBI to finish;
> - a new Linux boot "thorough" test that will boot the machine up to the
> buildroot prompt.
> 
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>

> ---
>  tests/functional/riscv64/meson.build        |  2 +
>  tests/functional/riscv64/test_opensbi.py    |  4 ++
>  tests/functional/riscv64/test_server_ref.py | 59 +++++++++++++++++++++
>  3 files changed, 65 insertions(+)
>  create mode 100755 tests/functional/riscv64/test_server_ref.py
> 
> diff --git a/tests/functional/riscv64/meson.build b/tests/functional/riscv64/meson.build
> index 5871211e89..2eb12586bf 100644
> --- a/tests/functional/riscv64/meson.build
> +++ b/tests/functional/riscv64/meson.build
> @@ -2,6 +2,7 @@
>  
>  test_riscv64_timeouts = {
>    'boston' : 120,
> +  'server_ref' : 120,
>    'tuxrun' : 120,
>  }
>  
> @@ -13,6 +14,7 @@ tests_riscv64_system_quick = [
>  tests_riscv64_system_thorough = [
>    'endianness',
>    'boston',
> +  'server_ref',
>    'sifive_u',
>    'tuxrun',
>  ]
> diff --git a/tests/functional/riscv64/test_opensbi.py b/tests/functional/riscv64/test_opensbi.py
> index d077e40f42..057f55f90b 100755
> --- a/tests/functional/riscv64/test_opensbi.py
> +++ b/tests/functional/riscv64/test_opensbi.py
> @@ -32,5 +32,9 @@ def test_riscv_virt(self):
>          self.set_machine('virt')
>          self.boot_opensbi()
>  
> +    def test_riscv_server_ref(self):
> +        self.set_machine('riscv-server-ref')
> +        self.boot_opensbi()
> +
>  if __name__ == '__main__':
>      QemuSystemTest.main()
> diff --git a/tests/functional/riscv64/test_server_ref.py b/tests/functional/riscv64/test_server_ref.py
> new file mode 100755
> index 0000000000..2ecfcf60ad
> --- /dev/null
> +++ b/tests/functional/riscv64/test_server_ref.py
> @@ -0,0 +1,59 @@
> +#!/usr/bin/env python3
> +#
> +# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +#
> +"""
> +riscv-server-ref board test
> +"""
> +
> +from qemu_test import QemuSystemTest, Asset
> +from qemu_test import wait_for_console_pattern
> +
> +class RiscvServerRefTest(QemuSystemTest):
> +    """
> +    Test the riscv-server-ref board
> +    """
> +
> +    ASSET_KERNEL = Asset(
> +        ('https://github.com/danielhb/qemu-machine-boot/raw/refs/heads/'
> +         'master/riscv/images/virt64/buildroot/Image'),
> +        '6bacc876c769c1bb6057d2bf549eba67fbe83916e8223f9fe21c8e8fff665a36')
> +
> +    ASSET_ROOTFS = Asset(
> +        ('https://github.com/danielhb/qemu-machine-boot/raw/refs/heads/'
> +         'master/riscv/images/virt64/buildroot/rootfs.ext2'),
> +        'f00bb88749f945d80675540a1338bd1ccb226574685a5b6c65ab44027d0411a8')
> +
> +    def test_boot_linux_test(self):
> +        self.set_machine('riscv-server-ref')
> +        kernel_path = self.ASSET_KERNEL.fetch()
> +        rootfs_path = self.ASSET_ROOTFS.fetch()
> +
> +        self.vm.add_args('-kernel', kernel_path)
> +        self.vm.add_args('-append', 'rw rootwait root=/dev/sda')
> +        self.vm.add_args('-drive',
> +            f'file={rootfs_path},format=raw,id=hd0,snapshot=on,if=none')
> +        self.vm.add_args('-device', 'ahci,id=ahci')
> +        self.vm.add_args('-device', 'ide-hd,drive=hd0,bus=ahci.0')
> +
> +        self.vm.set_console()
> +        self.vm.launch()
> +
> +        # Wait for OpenSBI
> +        wait_for_console_pattern(self, 'OpenSBI')
> +
> +        # Wait for Linux kernel boot
> +        wait_for_console_pattern(self, 'Linux version')
> +        wait_for_console_pattern(self, 'Machine model: qemu,riscv-server-ref')
> +
> +        # Test e1000e network card functionality
> +        wait_for_console_pattern(self, 'e1000e')
> +        wait_for_console_pattern(self, 'Network Connection')
> +
> +        # Wait for boot to complete - system reaches login prompt
> +        wait_for_console_pattern(self, 'Run /sbin/init as init process')
> +
> +if __name__ == '__main__':
> +    QemuSystemTest.main()
> -- 
> 2.43.0
> 

