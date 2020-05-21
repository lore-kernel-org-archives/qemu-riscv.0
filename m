Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jbp4U-0007iU-KO
	for mharc-qemu-riscv@gnu.org; Thu, 21 May 2020 13:33:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbp4T-0007cQ-5y
 for qemu-riscv@nongnu.org; Thu, 21 May 2020 13:33:29 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:31859
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbp4R-0008Ow-LY
 for qemu-riscv@nongnu.org; Thu, 21 May 2020 13:33:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590082407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OQzcYHoz5Czl27l47Bsn/r0C/ioFvgugtKBDv+ZDzvI=;
 b=CEv14PWvz/40D85956VoKtXEPGKaKWEkU9zmNz0cxOvcm/FrLzen7kcJkHCv9IHtlQyDed
 WH2k/4asfsv14BO81ajCabXCLJHedh1siq3YbypqfSX4481rWHw1Aw5dzsk5LSmy0ItaZq
 xKLLcyFIRO9T697JdJv5elUhitiU2Yg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-EbMBub11Nta-mO6NLnMHxg-1; Thu, 21 May 2020 13:33:23 -0400
X-MC-Unique: EbMBub11Nta-mO6NLnMHxg-1
Received: by mail-wm1-f72.google.com with SMTP id f62so2943484wme.3
 for <qemu-riscv@nongnu.org>; Thu, 21 May 2020 10:33:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OQzcYHoz5Czl27l47Bsn/r0C/ioFvgugtKBDv+ZDzvI=;
 b=P+95nypPtWtunPKIlkOR6iSle8linliv1vk0UcehT4EWYcdbha2c3A/JdIrtZ+dVQ4
 1pLy2v0BVEU9ygyKVXV/pAajN7KjvyqlOQvRqOYEvtaOZOl89h5JDO2W1Mufuc96KBTr
 09psJ0ZoDEMNDeKt7vywEF4SxvolAHK8hSnLA/BOOKYgbMC1BEhgVjBijbEtu7d8mXTP
 jUKPIBstmIPgUbXYJVFBSjGEUteKFk3bjFj/s+NLmYbuvvt0yufNRjhLBKfagMBUynow
 c1XxnkapZ4nn4mOYCEy9v0wJyhD4oxveHQfbqBUZarudUxEB9HPEfAiDSW1xs4UVrtPT
 ZV5w==
X-Gm-Message-State: AOAM531txUcqgh6roqlVjcT0KijxF1d6RItwx2b0F0nZVL+cdOg2Dl6O
 JT3RWIKzv88ghdPlfwF+08JWD+/HxS33KQ4nMqcVLawMSDgXEjEXpAofPJiDijcdT5nDD8rYpaG
 XqAEWBrnnf6g/o2Txf13mQKoXkl3t5Z0=
X-Received: by 2002:adf:ea90:: with SMTP id s16mr9308898wrm.19.1590082402031; 
 Thu, 21 May 2020 10:33:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+INRqLmVepUVc5FujEo7H1z2llLpkyx3c2FVOPx4CQ4GD5/5NAX2vE17qQsk32IOk3uQVnK0Q8A0dHSMAjyk=
X-Received: by 2002:adf:ea90:: with SMTP id s16mr9308857wrm.19.1590082401656; 
 Thu, 21 May 2020 10:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200515170804.5707-1-philmd@redhat.com>
 <20200515170804.5707-10-philmd@redhat.com>
In-Reply-To: <20200515170804.5707-10-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Thu, 21 May 2020 19:33:10 +0200
Message-ID: <CAP+75-WA8mDfBHkUtHvz_q3n__CH-XmKA-Jf92FHFFOQR4oUFQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] Makefile: Allow target-specific optional Kconfig
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Chris Wulff <crwulff@gmail.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Marek Vasut <marex@denx.de>, Michael Walle <michael@walle.cc>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 01:44:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 21 May 2020 17:33:29 -0000

On Fri, May 15, 2020 at 7:08 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Allow use of target-specific Kconfig file.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  Makefile | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index b4c0830b26..5fce168fcb 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -423,11 +423,13 @@ MINIKCONF_INPUTS =3D $(SRC_PATH)/Kconfig.host \
>                     $(SRC_PATH)/accel/Kconfig \
>                     $(SRC_PATH)/hw/Kconfig
>  MINIKCONF_DEPS =3D $(MINIKCONF_INPUTS) \
> -                 $(wildcard $(SRC_PATH)/hw/*/Kconfig)
> +                 $(wildcard $(SRC_PATH)/hw/*/Kconfig) \
> +                 $(wildcard $(SRC_PATH)/target/*/Kconfig)
>  MINIKCONF =3D $(PYTHON) $(SRC_PATH)/scripts/minikconf.py
>
>  $(SUBDIR_DEVICES_MAK): %/config-devices.mak: default-configs/%.mak $(MIN=
IKCONF_DEPS) $(BUILD_DIR)/config-host.mak
>         $(call quiet-command, $(MINIKCONF) $(MINIKCONF_ARGS) \
> +               $(wildcard $(SRC_PATH)/target/$(firstword $(subst -, ,$@)=
)/Kconfig) \

This is incorrect, $@ is a $TARGET_ARCH (example aarch64) and we want
to include $TARGET_BASE_ARCH (example arm).

>                 > $@.tmp, "GEN", "$@.tmp")
>         $(call quiet-command, if test -f $@; then \
>           if cmp -s $@.old $@; then \
> --
> 2.21.3
>


