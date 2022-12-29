Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAqvU-0003I6-Gv
	for mharc-qemu-riscv@gnu.org; Thu, 29 Dec 2022 06:18:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pAqvT-0003Hn-A0; Thu, 29 Dec 2022 06:18:19 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pAqvQ-0005kP-LV; Thu, 29 Dec 2022 06:18:18 -0500
Received: by mail-ed1-x52d.google.com with SMTP id c17so26253944edj.13;
 Thu, 29 Dec 2022 03:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p9rTDLM3+byFxm1EaEDqnOzLtcbqunGtJlLYE+Gl8/g=;
 b=YSuLRtrHRmtV8qEnCTBcPN/XwNhx5fJ/fQAZx5d469TB91+sdHzyTZoEgp7SB+GaGe
 Vvo+xhC0STwGK6nFbFJcdJDWo+mNSY0NdnQss7kAE29IxCckBJ1dG+DNjWb6R6ahr0k7
 oHqgnwAvXtUQQqKIIdF26vUt6RVndpvEFTfIBw2teY/ZR6vIkGxSHlTwnk2djUzEWP9K
 hMUrciCZqkbWQoJJCHd9LfeYzWUwSl1w/9n6KR0/2cbr5xAgjWOVn/PD8AbE2/s+Z2xf
 AwQ0bqfZOw9TttNmFyrUUiKhMs2mbeFSXDKOxLBbeZSQ/iKbjElLQ8dPxNcACIBilJTu
 AfwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p9rTDLM3+byFxm1EaEDqnOzLtcbqunGtJlLYE+Gl8/g=;
 b=Vk2wkI6yUWbHRjEfcR7sVXf6k53AojTLjNN3UvTUTBuANoMdAuPFmIPWR/88xhpzvM
 PnjnNylCvtd3fz7uBIL/cm0DrTr6PJMT52BsqKZBstpMReN3eDTikR1KUOWn72fRxwlc
 cXda4BqLmmBjb7kx1Ei/pUQHn0EykQY0Z8zEblsoF/Qy8jobRUurSkrwcbOF7Yr/GUd6
 Nn2qdEt1iDgwe/yXMXfnKuYYkExKYDCA5eNOTORKLmMHOu5cYNfh7hfS9Vr/xIKmwOGR
 B/X44TBsJwZVcing5i4A+vIQXmz6aO/XN/Vv+Rx2RMAW5yiIV6f1rxTrUUk76OGk9Rqb
 STwA==
X-Gm-Message-State: AFqh2koVRc1Ws7WC2JDvKQpTkWhbQQogxWtLgSzNVtrFOf6xkyHT2zz5
 pWufhDit5VXgX8jkQ1etQ9NpvlTdnDV46vxZtf8=
X-Google-Smtp-Source: AMrXdXs/jSDoo8oPSKlRFvWlWVdSN7s4VzS8eq31+PkAgDofCBmyvUtApLOPAxKLOkLTPQfUei7js3UpLzYrmEYL3hw=
X-Received: by 2002:a05:6402:6c1:b0:46d:94b0:e6e5 with SMTP id
 n1-20020a05640206c100b0046d94b0e6e5mr3290441edy.380.1672312694646; Thu, 29
 Dec 2022 03:18:14 -0800 (PST)
MIME-Version: 1.0
References: <20221228133336.197467-1-dbarboza@ventanamicro.com>
 <20221228133336.197467-2-dbarboza@ventanamicro.com>
 <CAEUhbmXyth6ENTPkX8j5G=+OZ4XxL70S6V989g94w7JSSdAobQ@mail.gmail.com>
 <a759543f-91b4-4905-400d-3fbe1921226b@ventanamicro.com>
In-Reply-To: <a759543f-91b4-4905-400d-3fbe1921226b@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 29 Dec 2022 19:18:03 +0800
Message-ID: <CAEUhbmXCMVU+eCzgCwNtBkLVYLDvG4XO_U9XkAgjCjZQKHB_Ag@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] tests/avocado: add RISC-V opensbi boot test
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 29 Dec 2022 11:18:19 -0000

Hi Daniel,

On Thu, Dec 29, 2022 at 4:21 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 12/28/22 12:18, Bin Meng wrote:
> > On Wed, Dec 28, 2022 at 9:38 PM Daniel Henrique Barboza
> > <dbarboza@ventanamicro.com> wrote:
> >> This test is used to do a quick sanity check to ensure that we're able
> >> to run the existing QEMU FW image.
> >>
> >> 'sifive_u', 'spike' and 'virt' riscv64 machines, and 'sifive_u' and
> >> 'virt' 32 bit machines are able to run the default RISCV64_BIOS_BIN |
> >> RISCV32_BIOS_BIN firmware with minimal options.
> >>
> >> The riscv32 'spike' machine isn't bootable at this moment, requiring a=
n
> >> Opensbi fix [1] and QEMU side changes [2]. We could just leave at that
> > nits: OpenSBI
> >
> >> or add a 'skip' test to remind us about it. To work as a reminder that
> >> we have a riscv32 'spike' test that should be enabled as soon as Opens=
bi
> > ditto
> >
> >> QEMU rom receives the fix, we're adding a 'skip' test:
> >>
> >> (11/18) tests/avocado/riscv_opensbi.py:RiscvOpensbi.test_riscv32_spike=
:
> >>          SKIP: requires OpenSBI fix to work
> >>
> >> [1] https://patchwork.ozlabs.org/project/opensbi/patch/20221226033603.=
1860569-1-bmeng@tinylab.org/
> >> [2] https://patchwork.ozlabs.org/project/qemu-devel/list/?series=3D334=
159
> >>
> >> Cc: Cleber Rosa <crosa@redhat.com>
> >> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> >> ---
> >>   tests/avocado/riscv_opensbi.py | 65 ++++++++++++++++++++++++++++++++=
++
> >>   1 file changed, 65 insertions(+)
> >>   create mode 100644 tests/avocado/riscv_opensbi.py
> >>
> >> diff --git a/tests/avocado/riscv_opensbi.py b/tests/avocado/riscv_open=
sbi.py
> >> new file mode 100644
> >> index 0000000000..3549d36a11
> >> --- /dev/null
> >> +++ b/tests/avocado/riscv_opensbi.py
> >> @@ -0,0 +1,65 @@
> >> +# OpenSBI boot test for RISC-V machines
> >> +#
> >> +# Copyright (c) 2022, Ventana Micro
> >> +#
> >> +# This work is licensed under the terms of the GNU GPL, version 2 or
> >> +# later.  See the COPYING file in the top-level directory.
> >> +
> >> +from avocado_qemu import QemuSystemTest
> >> +from avocado import skip
> >> +from avocado_qemu import wait_for_console_pattern
> >> +
> >> +class RiscvOpensbi(QemuSystemTest):
> >> +    """
> >> +    :avocado: tags=3Daccel:tcg
> >> +    """
> >> +    timeout =3D 5
> >> +
> >> +    def boot_opensbi(self):
> >> +        self.vm.set_console()
> >> +        self.vm.launch()
> >> +        wait_for_console_pattern(self, 'Platform Name')
> >> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
> >> +
> >> +    def test_riscv64_virt(self):
> >> +        """
> >> +        :avocado: tags=3Darch:riscv64
> >> +        :avocado: tags=3Dmachine:virt
> >> +        """
> >> +        self.boot_opensbi()
> >> +
> >> +    def test_riscv64_spike(self):
> >> +        """
> >> +        :avocado: tags=3Darch:riscv64
> >> +        :avocado: tags=3Dmachine:spike
> >> +        """
> >> +        self.boot_opensbi()
> >> +
> >> +    def test_riscv64_sifive_u(self):
> >> +        """
> >> +        :avocado: tags=3Darch:riscv64
> >> +        :avocado: tags=3Dmachine:sifive_u
> >> +        """
> >> +        self.boot_opensbi()
> > nits: could we keep both 64-bit and 32-bit machines in the same order?
> > e.g.: virt, sifive_u, spike
>
> I've changed the order to be first the default machine (spike), then the =
other
> machines in alphabetic order.
>
> I've also put the 32 and 64 bit tests for the same machine one after the =
other:
>
>   (06/18) tests/avocado/riscv_opensbi.py:RiscvOpenSBI.test_riscv32_spike:=
 SKIP: requires OpenSBI fix to work
>   (07/18) tests/avocado/riscv_opensbi.py:RiscvOpenSBI.test_riscv64_spike:=
 PASS (0.04 s)
>   (08/18) tests/avocado/riscv_opensbi.py:RiscvOpenSBI.test_riscv32_sifive=
_u: PASS (0.07 s)
>   (09/18) tests/avocado/riscv_opensbi.py:RiscvOpenSBI.test_riscv64_sifive=
_u: PASS (0.07 s)
>   (10/18) tests/avocado/riscv_opensbi.py:RiscvOpenSBI.test_riscv32_virt: =
PASS (0.05 s)
>   (11/18) tests/avocado/riscv_opensbi.py:RiscvOpenSBI.test_riscv64_virt: =
PASS (0.05 s)
>
>
>
> If that's ok I'll send v4 tomorrow.
>

Thanks, that looks good to me.

Regards,
Bin

