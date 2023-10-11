Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E436CD98D9
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 01:04:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqNe3-0005Jj-BJ; Tue, 10 Oct 2023 21:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqNe2-0005E5-Ew; Tue, 10 Oct 2023 21:04:14 -0400
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqNe0-0006d7-S3; Tue, 10 Oct 2023 21:04:14 -0400
Received: by mail-vk1-xa35.google.com with SMTP id
 71dfb90a1353d-49d0a704ac7so2372426e0c.1; 
 Tue, 10 Oct 2023 18:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696986249; x=1697591049; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aqO5ka7tR9qZcNKmHJAXn+ExW6wHOnY5HZ1B8d6xlA0=;
 b=WC1HpB0u6CSTXVOy6Nx4S53Ebuk+vN5a+I4PbpjWR7iVMQVm1FgguDO5Ran/SPsEPZ
 MBELeL9YXN7ccWlgq3OgM2USTdtEMMCHcoXIZWMoJ/1axZp9mIE2f9ayL7UO3KQ2+gUW
 5GZYoIfMzFGQv+6Q+7ddrB6zkkd+xPjfnY91r6Vut87NTre7dVlhahi3oBCVIV0mIybZ
 jjIHJozxAmsmSxOrLH0JPdMTXCYyd+PBedINvglwsODWf7BMZnInsCUVOulLmWW0P/Eh
 aWmogBXZwGev/SPL65PZfxw/+T9/9/kRMAglqHmJmxoiZFdlFam7eWGHRDwKb/McjucH
 YWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696986249; x=1697591049;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aqO5ka7tR9qZcNKmHJAXn+ExW6wHOnY5HZ1B8d6xlA0=;
 b=KO/8zy7AyqaFhhQRp4daBvo3bWksdtuLAXf/4C2SCvDeSuzbeHK/+F0jOofFImv5O5
 hu2Xz5muFgNSbMcv2zCRwByL0xQIXQPGo6djfdtsFwBqGX8kgv6u066KEC5uvbZaRraz
 KGSKHLPFzVA2PbsyMF49yWXI2Cc7ZER8HjSJoQP0xcEgwTmlHpBHmN4cIdy5ys4W6qbl
 vfG4XNojTYqXliOu94ZrG5mLzSE+8ZaotmLmJjme/OaGIBWjELUHMOvDHsuTP0G4fkVo
 BDjjNUs6rmdIO60xSYYVOfTf1OC9Y7hcs8lpNIvlCntDOcPzSJ2X3nWravZnjmOTXE8o
 lKww==
X-Gm-Message-State: AOJu0YxV/vaessP4oAy/IQ3Wh9rHzJ8StCYV+pFl71zU2y0Z+Z0dvQBV
 C/Nedu7kMdokOZjDuuCMFAkeHirhbUXZ6u7vf3o=
X-Google-Smtp-Source: AGHT+IE+dECs0/kWr7vwAr7Wy9VndFb7DLF3LT2g8gzD4c35dqPtmKLYacBfQzZPQpjsSy45eTmlKRIHhMi98CmdBdM=
X-Received: by 2002:a1f:c9c1:0:b0:49d:3e4c:6168 with SMTP id
 z184-20020a1fc9c1000000b0049d3e4c6168mr15264409vkf.7.1696986249500; Tue, 10
 Oct 2023 18:04:09 -0700 (PDT)
MIME-Version: 1.0
References: <20231009164104.369749-1-alex.bennee@linaro.org>
 <20231009164104.369749-17-alex.bennee@linaro.org>
In-Reply-To: <20231009164104.369749-17-alex.bennee@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Oct 2023 11:03:42 +1000
Message-ID: <CAKmqyKN86xUqKMjd6U=2pno962DnMNVVRzfJCycT=S_62+PXVw@mail.gmail.com>
Subject: Re: [PATCH 16/25] target/arm: Remove references to gdb_has_xml
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Brad Smith <brad@comstyle.com>, 
 Radoslaw Biernacki <rad@semihalf.com>, David Hildenbrand <david@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-riscv@nongnu.org, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, 
 Nicholas Piggin <npiggin@gmail.com>, Bin Meng <bin.meng@windriver.com>, 
 Leif Lindholm <quic_llindhol@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org, 
 John Snow <jsnow@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Yanan Wang <wangyanan55@huawei.com>, 
 Weiwei Li <liweiwei@iscas.ac.cn>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Beraldo Leal <bleal@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-s390x@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa35.google.com
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

On Tue, Oct 10, 2023 at 3:52=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>
> GDB has XML support since 6.7 which was released in 2007.
> It's time to remove support for old GDB versions without XML support.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20230912224107.29669-10-akihiko.odaki@daynix.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/arm/gdbstub.c | 32 ++------------------------------
>  1 file changed, 2 insertions(+), 30 deletions(-)
>
> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
> index 8fc8351df7..b7ace24bfc 100644
> --- a/target/arm/gdbstub.c
> +++ b/target/arm/gdbstub.c
> @@ -46,21 +46,7 @@ int arm_cpu_gdb_read_register(CPUState *cs, GByteArray=
 *mem_buf, int n)
>          /* Core integer register.  */
>          return gdb_get_reg32(mem_buf, env->regs[n]);
>      }
> -    if (n < 24) {
> -        /* FPA registers.  */
> -        if (gdb_has_xml()) {
> -            return 0;
> -        }
> -        return gdb_get_zeroes(mem_buf, 12);
> -    }
> -    switch (n) {
> -    case 24:
> -        /* FPA status register.  */
> -        if (gdb_has_xml()) {
> -            return 0;
> -        }
> -        return gdb_get_reg32(mem_buf, 0);
> -    case 25:
> +    if (n =3D=3D 25) {
>          /* CPSR, or XPSR for M-profile */
>          if (arm_feature(env, ARM_FEATURE_M)) {
>              return gdb_get_reg32(mem_buf, xpsr_read(env));
> @@ -100,21 +86,7 @@ int arm_cpu_gdb_write_register(CPUState *cs, uint8_t =
*mem_buf, int n)
>          env->regs[n] =3D tmp;
>          return 4;
>      }
> -    if (n < 24) { /* 16-23 */
> -        /* FPA registers (ignored).  */
> -        if (gdb_has_xml()) {
> -            return 0;
> -        }
> -        return 12;
> -    }
> -    switch (n) {
> -    case 24:
> -        /* FPA status register (ignored).  */
> -        if (gdb_has_xml()) {
> -            return 0;
> -        }
> -        return 4;
> -    case 25:
> +    if (n =3D=3D 25) {
>          /* CPSR, or XPSR for M-profile */
>          if (arm_feature(env, ARM_FEATURE_M)) {
>              /*
> --
> 2.39.2
>
>

