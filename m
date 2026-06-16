Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE3FCD98DA
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 01:07:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZIHA-00052n-2Q; Mon, 15 Jun 2026 21:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZIH8-0004y9-32
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 21:07:34 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZIH6-00036f-Fm
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 21:07:33 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-68852b58d87so6992162a12.3
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 18:07:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781572051; cv=none;
 d=google.com; s=arc-20240605;
 b=HtwvcT1svjNZX3wLsm3QVwP229W6Zmmq+K/TQR2CpGz9CndjQXwzvRhav2jg1LI82V
 zva4ZJsDHd0MiYtrNhUYMc1HfPeNqqPjPHX0qZBfcr0INk4/Di8amj8I6eNBxf3uUv0N
 OH8D1Da5NI86PO+wlNTnCNjg4TAgsQt6m560h1ELv9me9gxvhEU8asyR6L/k8KmSKjWb
 ARcTsIhyrbgUqHkJtTfOwaoW2Yn8VdCyUsEeTFeW7SGaYxxucoYy1WOi+nRbqi6W6sO9
 jjGzm0fJIwm2ct0xlKYOB5PCtxlDPLZ2lXv2V8pFBH7TJCi4/ode2pmkLhmbbaC788Uq
 69SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=TBPhuN9NEq+v7SgYwgjQrUGIjGvKiiB7ShYgVjcCrtE=;
 fh=cZqNB/EzXQiYRyAzuV3VEKhSQw+8bGFrfLPSePfSLec=;
 b=O72PARhjZCTdZ27xJKantlVOsQSXml5Z9D5TWmYyE9wuauQMb67ZfB6BU0+GPeVZuf
 hRWP0uivtsxgYw4l2qGzO7xulPSugc/pU0hg/yUmdzfuwujJ/lK4scHbBeuaSFc0U1f3
 Z7xoZiVoaWz695hfq9H1aQZihpn/9GQwSDNQg8/QBlf0bCqBDv7XLZSuGNl78+FTDOgj
 T3L9KO1n/OeKUCNky+wqNLvV90fmS7IRtyshLdUUrquAxxrZfJz1XpyPDwhOSpcnY1jm
 pmaa8W9XywXw19e/X/TmGMpZ/L2x7RAPEalSsGBqBHu3f0NKrrBLE62eooTiZOUr2m1I
 Wjjg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781572051; x=1782176851; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TBPhuN9NEq+v7SgYwgjQrUGIjGvKiiB7ShYgVjcCrtE=;
 b=ZslVwC83a86NrIXz16TYHHypON2l3AjEr+AK6kyFV3Tbjqk7Dr3WvZB51VT2Ng1jwe
 WMJ0hrwD6YmHL9wBfKphU0qxfJVlCotFy1VGOObRsHCgng/PoJ0hNmQnZXhFJghHDJQw
 cOmM+6UNx3wHXUeJ2ScpdW8Ii0HaC9zdQ+cWUMo7QnY3HrwPV5/vVhymJ4VHw7cVHmPx
 UfLPoG6XgRHA4rNj30+m+iWKVQtzb4x6BRpsAf0C4HPKFH9IE8gtMC1qTLY2l09L22ya
 dkkG4B6acIn4r2LQPiarrfxAdGAKY0+DIQUTZTt0VBVwr2WRF7scqbTiJmFMqFMVp49e
 cxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781572051; x=1782176851;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TBPhuN9NEq+v7SgYwgjQrUGIjGvKiiB7ShYgVjcCrtE=;
 b=Jop8ni2Izu6SNd/BL9mflZpeo6DIHmHDjSp2lKqXccBPjsLEna9W4tRfZORzSC9T12
 5M/kxjYNz+Llaz41fFf6XZagwany6jXGc1xJKOaK17i2fs1+dFsixN0dsN209UW4xpGx
 AQabfd6ajOfmAi0segpAHJFt2Zj09380kDlK26fdfl3uVo1mqfa6ziRLqnqjksN81FVL
 S1oLFzu1qUqWwMOTBE0gCaKCEix7mg7XFvItz2a0w5q57sl40zcL+O7Xn08iD93CJO4h
 DZh9ANHion4eaBa9Shsvs4HiwzFvG20bKTPwCC1/1TB1oZkuDL4srC7uKBKb2+jgBsWb
 hJHg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/TmBjXNyeLcy84jWdYd8ur3XzFaCJYknumVeXJ0H45km6Ha4TUm5OL30/tz6w4yUPPbljK/iLGtMzF@nongnu.org
X-Gm-Message-State: AOJu0YwJ+2lVrl1/+Hzr3Q6eIcpCIzRTWpdru0Sr5WDUl+5E+y8vKBdE
 ehfqddSdYbIrPIknA4VENrr5kI3jbOpV9SFDZKYhXGvpSddNZdNDHRRPQNctKrDGhPbMAThiPOF
 sTmbu88Gta2h8agGflMTWry4Iha9KimY=
X-Gm-Gg: Acq92OFrublgSRK4ioYpp2CGj6/WVvSrY+8LAqk0IhR/YtiRuxrqwIjdyZ5XnHyjNBO
 2PRXLyzu1Sj4XDG5ANUMkWqtohNt5xMgG4wJkYZPH1o6CvFVJmqjS9WZq9IgkefwmMm2EKHznWS
 ljxfdBrQhOX6dzAKnBSIf0SWf2wPa2grseMd/fafLU9N18jq10+Mt4hJ/lo4oGFAMDqW/eh61mC
 Hr/tSdY69LG6pZVDt/v9edny+afZRIqOIBPTJ0alSbTY7dWKYxoAuO0lt2G2jhiCNS15mZPkpTF
 6gOw0ADZVJFtfJavHoJ1HSZaj/uID4T6wN0Diw==
X-Received: by 2002:a05:6402:4014:b0:692:4759:ac57 with SMTP id
 4fb4d7f45d1cf-693c6a10b82mr5104898a12.2.1781572051025; Mon, 15 Jun 2026
 18:07:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260610214133.1882563-1-daniel.barboza@oss.qualcomm.com>
 <20260610214133.1882563-7-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260610214133.1882563-7-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Jun 2026 11:07:04 +1000
X-Gm-Features: AVVi8CfpvrPAedNGaTwfl_W9jmYjznTpopZIdlpqcBwt1N7BxoDTQG480rk-5cE
Message-ID: <CAKmqyKPh0XGqrENq-G9aFFE18iwmMW3GeOK2JPuNs3zCXfNOmQ@mail.gmail.com>
Subject: Re: [PATCH v8 6/7] tests/functional/riscv64: add riscv-server-ref TPM
 selftest
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 andrew.jones@oss.qualcomm.com, leif.lindholm@oss.qualcomm.com, uwu@icenowy.me, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Jun 11, 2026 at 7:44=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> Add a TPM specific selftest for the riscv-server-ref board.  The test
> will be skipped if there's no 'swtpm' in the host.
>
> The test has been basically cloned from our Aspeed ast2600 friends.
> Shoutout to monsieur C=C3=A9dric Le Goater for the code.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tests/functional/riscv64/test_server_ref.py | 31 ++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
>
> diff --git a/tests/functional/riscv64/test_server_ref.py b/tests/function=
al/riscv64/test_server_ref.py
> index 2ecfcf60ad..9b120628dc 100755
> --- a/tests/functional/riscv64/test_server_ref.py
> +++ b/tests/functional/riscv64/test_server_ref.py
> @@ -8,8 +8,13 @@
>  riscv-server-ref board test
>  """
>
> +import os
> +import tempfile
> +import subprocess
> +
>  from qemu_test import QemuSystemTest, Asset
>  from qemu_test import wait_for_console_pattern
> +from qemu_test import skipIfMissingCommands
>
>  class RiscvServerRefTest(QemuSystemTest):
>      """
> @@ -26,7 +31,7 @@ class RiscvServerRefTest(QemuSystemTest):
>           'master/riscv/images/virt64/buildroot/rootfs.ext2'),
>          'f00bb88749f945d80675540a1338bd1ccb226574685a5b6c65ab44027d0411a=
8')
>
> -    def test_boot_linux_test(self):
> +    def _test_boot_linux_test(self, tpmstate_dir=3DNone):
>          self.set_machine('riscv-server-ref')
>          kernel_path =3D self.ASSET_KERNEL.fetch()
>          rootfs_path =3D self.ASSET_ROOTFS.fetch()
> @@ -38,6 +43,22 @@ def test_boot_linux_test(self):
>          self.vm.add_args('-device', 'ahci,id=3Dahci')
>          self.vm.add_args('-device', 'ide-hd,drive=3Dhd0,bus=3Dahci.0')
>
> +        if tpmstate_dir is not None:
> +            # Note: code taken verbatim from
> +            # tests/functional/arm/test_aspeed_ast2600_buildroot_tpm.py
> +
> +            # We must put the TPM state dir in /tmp/, not the build dir,
> +            # because some distros use AppArmor to lock down swtpm and
> +            # restrict the set of locations it can access files in.
> +            socket =3D os.path.join(tpmstate_dir, 'swtpm-socket')
> +            subprocess.run(['swtpm', 'socket', '-d', '--tpm2',
> +                            '--tpmstate', f'dir=3D{tpmstate_dir}',
> +                            '--ctrl', f'type=3Dunixio,path=3D{socket}'],
> +                           check=3DTrue)
> +            self.vm.add_args('-chardev', f'socket,id=3Dchrtpm,path=3D{so=
cket}')
> +            self.vm.add_args('-tpmdev', 'emulator,id=3Dtpm0,chardev=3Dch=
rtpm')
> +            self.vm.add_args('-device', 'tpm-tis-device,tpmdev=3Dtpm0')
> +
>          self.vm.set_console()
>          self.vm.launch()
>
> @@ -55,5 +76,13 @@ def test_boot_linux_test(self):
>          # Wait for boot to complete - system reaches login prompt
>          wait_for_console_pattern(self, 'Run /sbin/init as init process')
>
> +    def test_boot_linux_test(self):
> +        self._test_boot_linux_test()
> +
> +    @skipIfMissingCommands('swtpm')
> +    def test_boot_linux_test_tpm(self):
> +        with tempfile.TemporaryDirectory(prefix=3D"qemu_") as tpmstate_d=
ir:
> +            self._test_boot_linux_test(tpmstate_dir)
> +
>  if __name__ =3D=3D '__main__':
>      QemuSystemTest.main()
> --
> 2.43.0
>
>

