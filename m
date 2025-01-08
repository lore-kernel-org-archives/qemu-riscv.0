Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13164E77188
	for <qemu-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 07:04:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tVQ6W-0003hJ-1E; Wed, 08 Jan 2025 02:03:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tVQ6P-0003fY-Oy
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2025 02:03:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tVQ6L-0004SX-Mo
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2025 02:03:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736319816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=NatfcuudAJ8cyj0CEfSoHFM2avWlrQG2di0+ZhF3h54=;
 b=T6xZ1sjwc21b64wxJsQuGtcmlJoH3Duj1GaPpDzKdGmNrQW72SpTnSj56pkTEhqV29/9dv
 js+5ndiWxBgB+2FTAn3D0UTKVfelEiwhKatgmUYP1+lVNDts3r+IcyU7k7H0XSq1K1fBBs
 vVuoeysTp9AMRylsng5KBoVy3PJIF8I=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-Q6Wk0UuDMIGEJOJRoZk-UA-1; Wed, 08 Jan 2025 02:03:33 -0500
X-MC-Unique: Q6Wk0UuDMIGEJOJRoZk-UA-1
X-Mimecast-MFC-AGG-ID: Q6Wk0UuDMIGEJOJRoZk-UA
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-aaf8396f65fso601709466b.0
 for <qemu-riscv@nongnu.org>; Tue, 07 Jan 2025 23:03:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736319812; x=1736924612;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NatfcuudAJ8cyj0CEfSoHFM2avWlrQG2di0+ZhF3h54=;
 b=WdF9Z30PpN8DmXIRGpebB0eRzJOG+MUqEoFupu0hpc4kGLq5ICMK0CJv7LxJH9HZVn
 24c0rbHVfEtW5GCGI7aNvv+jOm2dVJy9Dfd0ywbru7s4UHdIyuitYu7qQWFcavXObGpT
 25Xay9SPa9Ihv1AjT0fegCO6iz6SBPjbNQdgW3YbD1FXT9fqpU2m7ZK0NRpkVx2u2wLR
 dFi5cHwYWSaZn0Q3Xf6+AUCMWQCDtd+2eMMHZBGsa93uO/nZu3ECGs9BDUDb4dBwKlUE
 3BskFkNDntgTCEXUm8L/fDvBiEU535u316F/kmFFUMQTliF/KCL3A8EF2vFIZqw0wMQ3
 sIHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmnsE9XiWAK8tzjV9bH/ZKa8OMklkN4okz1+e2gTUKKu78q1+FAKynic2y6uJu3V4rZGO2lJnHlKrT@nongnu.org
X-Gm-Message-State: AOJu0YyHNTgjBvhy5MwZUKPkgH94T3+vGtlZjA6eqfpbcGXfuifUCVCw
 jT5tCzEQhByo5sYUtUKzeg8f+mnf/Fs1ChWeMpbwBi2ycRrYeO2pEORhi0RWXBbz8Pi2dDy0vfP
 0j/SJWK2sTvMYQURceLERF4WzuWf7aX2PgXDC9uiAR99ChcFBNhv8
X-Gm-Gg: ASbGncsBvpurypodZmj7OfrB4/gLTKw8XrSOlZsnLQ0Z4prls2BeU9ITy5xDDQgUD9m
 ZHrmOY7UYr1v1sW/D0hyFPBG8gk+hQRB0IOsbnilRMCLx5vEmij3cS2bcmsBqAXhiU5fQU2k+Zk
 CnXwcytBPJhA9Dxf8wwW3y9pfKAs8fgfpAzofyw/2zTETjZNTLDzkHw3nQ2XFhB3PnIeVI4cSJl
 BtwSdvZllybwMJmDJmU5lQFJzshzstcZUULMbQZWuSKsJR5U05xvRkg8poodz8ULAmrBYkA94wQ
 9HH9g2TbbiOF
X-Received: by 2002:a17:907:2d08:b0:aac:278:98fd with SMTP id
 a640c23a62f3a-ab2ab6a3f9dmr119366966b.17.1736319812538; 
 Tue, 07 Jan 2025 23:03:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHp/Xv5yjxjb8L+ALt+dNKnSybwRD8J4dGSTBwCa1ZS+3iOdo7I7nb/1vmWWI3tQbtpiQaTaQ==
X-Received: by 2002:a17:907:2d08:b0:aac:278:98fd with SMTP id
 a640c23a62f3a-ab2ab6a3f9dmr119364266b.17.1736319812075; 
 Tue, 07 Jan 2025 23:03:32 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-49-182.web.vodafone.de.
 [109.42.49.182]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e894f2esm2491667166b.69.2025.01.07.23.03.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 23:03:31 -0800 (PST)
Message-ID: <f714ab7d-0056-4fd7-9804-62f669b50fcc@redhat.com>
Date: Wed, 8 Jan 2025 08:03:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 20/29] tests/functional: extend test_aarch64_virt with
 vulkan test
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Beraldo Leal <bleal@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-ppc@nongnu.org,
 John Snow <jsnow@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Nicholas Piggin <npiggin@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-riscv@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-s390x@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Fabiano Rosas <farosas@suse.de>,
 Weiwei Li <liwei1518@gmail.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 qemu-arm@nongnu.org, Li-Wen Hsu <lwhsu@freebsd.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Eric Farman <farman@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>,
 Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20250107165208.743958-1-alex.bennee@linaro.org>
 <20250107165208.743958-21-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250107165208.743958-21-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: f5eFVaQyyW6hKQvVmS7Nt23O1l23-_3QV9Mw9V63g44_1736319813
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.437,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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

On 07/01/2025 17.51, Alex Bennée wrote:
> Now we have virtio-gpu Vulkan support lets add a test for it.

I'm not a native speaker, but maybe rather:

Now that we have virtio-gpu Vulkan support, let's add a test for it.

?

...
> diff --git a/tests/functional/test_aarch64_virt.py b/tests/functional/test_aarch64_virt.py
> index 2d9995a95d..bb68048537 100755
> --- a/tests/functional/test_aarch64_virt.py
> +++ b/tests/functional/test_aarch64_virt.py
> @@ -13,11 +13,14 @@
>   import logging
>   from subprocess import check_call, DEVNULL
>   
> +from qemu.machine.machine import VMLaunchFailure
> +
> +from qemu_test import BUILD_DIR
>   from qemu_test import QemuSystemTest, Asset
> -from qemu_test import exec_command_and_wait_for_pattern
> +from qemu_test import exec_command, exec_command_and_wait_for_pattern
>   from qemu_test import wait_for_console_pattern
>   from qemu_test import get_qemu_img
> -
> +from qemu_test import skipIfMissingCommands, get_qemu_img
>   

Daniel recently tried to standardize two empty lines between the import and 
class statements, so could you please keep the empty line here?

>   class Aarch64VirtMachine(QemuSystemTest):
>       KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
> @@ -73,15 +76,16 @@ def common_aarch64_virt(self, machine):
>           Common code to launch basic virt machine with kernel+initrd
>           and a scratch disk.
>           """
> +        self.set_machine('virt')
> +        self.require_accelerator("tcg")

Thanks for moving this to the beginning of the function!

>           logger = logging.getLogger('aarch64_virt')
>   
>           kernel_path = self.ASSET_KERNEL.fetch()
>   
> -        self.set_machine('virt')
>           self.vm.set_console()
>           kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
>                                  'console=ttyAMA0')
> -        self.require_accelerator("tcg")
>           self.vm.add_args('-cpu', 'max,pauth-impdef=on',
>                            '-machine', machine,
>                            '-accel', 'tcg',
> @@ -102,7 +106,9 @@ def common_aarch64_virt(self, machine):
>   
>           # Add the device
>           self.vm.add_args('-blockdev',
> -                         f"driver=qcow2,file.driver=file,file.filename={image_path},node-name=scratch")
> +                         "driver=qcow2,file."
> +                         "driver=file,file."

The line breaks look weird here. I'd rather start a new line after the 
comma, not after the dot...? (also the changes look rather unrelated to the 
patch subject?)

> +                         f"filename={image_path},node-name=scratch")
>           self.vm.add_args('-device',
>                            'virtio-blk-device,drive=scratch')
>   
> @@ -131,5 +137,73 @@ def test_aarch64_virt_gicv2(self):
>           self.common_aarch64_virt("virt,gic-version=2")
>   
>   
> +    ASSET_VIRT_GPU_KERNEL = Asset(
> +        'https://fileserver.linaro.org/s/ce5jXBFinPxtEdx/'
> +        'download?path=%2F&files='
> +        'Image',
> +        '89e5099d26166204cc5ca4bb6d1a11b92c217e1f82ec67e3ba363d09157462f6')
> +
> +    ASSET_VIRT_GPU_ROOTFS = Asset(
> +        'https://fileserver.linaro.org/s/ce5jXBFinPxtEdx/'
> +        'download?path=%2F&files='
> +        'rootfs.ext4.zstd',
> +        '792da7573f5dc2913ddb7c638151d4a6b2d028a4cb2afb38add513c1924bdad4')
> +
> +    @skipIfMissingCommands('zstd')
> +    def test_aarch64_virt_with_gpu(self):
> +        # This tests boots with a buildroot test image that contains
> +        # vkmark and other GPU exercising tools. We run a headless
> +        # weston that nevertheless still exercises the virtio-gpu
> +        # backend.
> +
> +        self.set_machine('virt')
> +        self.require_accelerator("tcg")
> +
> +        kernel_path = self.ASSET_VIRT_GPU_KERNEL.fetch()
> +        image_path = self.uncompress(self.ASSET_VIRT_GPU_ROOTFS, format="zstd")
> +
> +        self.vm.set_console()
> +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
> +                               'console=ttyAMA0 root=/dev/vda')
> +
> +        self.vm.add_args("-accel", "tcg")
> +        self.vm.add_args("-cpu", "neoverse-v1,pauth-impdef=on")
> +        self.vm.add_args("-machine", "virt,gic-version=max",
> +                         '-kernel', kernel_path,
> +                         '-append', kernel_command_line)
> +        self.vm.add_args("-smp", "2", "-m", "2048")
> +        self.vm.add_args("-device",
> +                         "virtio-gpu-gl-pci,hostmem=4G,blob=on,venus=on")
> +        self.vm.add_args("-display", "egl-headless")
> +        self.vm.add_args("-display", "dbus,gl=on")
> +        self.vm.add_args("-device", "virtio-blk-device,drive=hd0")
> +        self.vm.add_args("-blockdev",
> +                         "driver=raw,file.driver=file,"
> +                         "node-name=hd0,read-only=on,"
> +                         f"file.filename={image_path}")
> +        self.vm.add_args("-snapshot")
> +
> +        try:
> +            self.vm.launch()
> +        except VMLaunchFailure as excp:
> +            if "old virglrenderer, blob resources unsupported" in excp.output:
> +                self.skipTest("No blob support for virtio-gpu")
> +            elif "old virglrenderer, venus unsupported" in excp.output:
> +                self.skipTest("No venus support for virtio-gpu")
> +            else:
> +                self.log.info("unhandled launch failure: {excp.output}")
> +                raise excp
> +
> +        self.wait_for_console_pattern('buildroot login:')
> +        exec_command(self, 'root')
> +        exec_command(self, 'export XDG_RUNTIME_DIR=/tmp')
> +        exec_command_and_wait_for_pattern(self,
> +                                          "weston -B headless "
> +                                          "--renderer gl "
> +                                          "--shell kiosk "
> +                                          "-- vkmark -b:duration=1.0",
> +                                          "vkmark Score")

The new test looks fine to me!

  Thomas


