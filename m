Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A302CD98E3
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 01:20:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqNu6-0004tQ-1R; Tue, 10 Oct 2023 21:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqNu2-0004kp-5F; Tue, 10 Oct 2023 21:20:46 -0400
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqNu0-0002Mf-CJ; Tue, 10 Oct 2023 21:20:45 -0400
Received: by mail-vk1-xa35.google.com with SMTP id
 71dfb90a1353d-49369d29be3so2677729e0c.3; 
 Tue, 10 Oct 2023 18:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696987242; x=1697592042; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nxowEQ025f/hHhKw/fHgzw8xVK2NHoFQEp7rcjqt/FM=;
 b=LS2yUM1XrGBb81+9kYUmv08OfD4A/2yKSOnEORnBXqN5XtBayKkmjiQqjJGPTAwbrt
 8ae/K4sn7iR1i2DGQsPcSE87UwZvvEzUjExQMYs9gStMB4ben4N6K9VagAuUIVNYmqVp
 JM6IqeHNTuczH3EqQ8feGdaAofVVN5sNaisO/l0aZvrQai7upOrB8ObACyJoCKNI+eS6
 gy1bwdR6TsQL0Utfqfw3JI6MVK/fcVQWdKp2Dqt3O7YUGBLXqSJbnj32rNqhmkq5ox7y
 sGiaCD0oBDZoK+4koPUWZq/FIBPbTcnQE197rgBe5dY2RwJwbu3nmrtTVqEg77OeLTCk
 z4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696987242; x=1697592042;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nxowEQ025f/hHhKw/fHgzw8xVK2NHoFQEp7rcjqt/FM=;
 b=f+O4vzVp2wNdxPFjIGb9AW7n4VfR/JqMXRSiPDp6pt8M1PMy0QOoAb44+bV3uoA/jV
 DGh5jsTfUbDin0c23hw52Cunx4lStRY0vjMPplbjGWMBhdZLFP8R+q6a8gkR1kYhkKOU
 NOSpb6d8q2/6B0xB68WtEGMlKWPjYvuRAOZJVmI5k6zPw+Ujw5Nw0oTNNvYnsJEtcx1g
 jCac86f0GbE405Wf/AcRw+FRiIbAqtjhHhAG8O1ujF6caARBRJfEZenILAMveNiLdmWh
 Z3MZymB2u/FIaneqRXz2GNMepMXk1hj96InAG0xLjSeHcWlGcB/pbIxdLenKkeKXruGp
 Ge5w==
X-Gm-Message-State: AOJu0YwVUmvTmOS4rRoCFhs/tW71hBASZtY6OsMjpLs2Bee5cP0eSWI6
 kmww366qrH0LKuP22awAWJsb0S3zc2EjMYhjG94=
X-Google-Smtp-Source: AGHT+IGXwGs7Z3/NteiZAHvlJPQR5/9goP1f/Xpsysht6b1ZhZ3j2VvhgrxhfvhK/eTzlvlztumARInROAMMkrx4e4A=
X-Received: by 2002:a05:6122:2004:b0:49d:611:a8cb with SMTP id
 l4-20020a056122200400b0049d0611a8cbmr20009110vkd.11.1696987242188; Tue, 10
 Oct 2023 18:20:42 -0700 (PDT)
MIME-Version: 1.0
References: <20231009110239.66778-1-philmd@linaro.org>
 <20231009110239.66778-2-philmd@linaro.org>
In-Reply-To: <20231009110239.66778-2-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Oct 2023 11:20:15 +1000
Message-ID: <CAKmqyKPbdGFaEvqtjUNEpdn1xQNJqrKwepHhhCW6frjUGGSFwg@mail.gmail.com>
Subject: Re: [PATCH 1/6] target/ppc: Use env_archcpu() in
 helper_book3s_msgsndp()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>, 
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-s390x@nongnu.org, 
 Ilya Leoshkevich <iii@linux.ibm.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Cameron Esfahani <dirty@apple.com>,
 qemu-ppc@nongnu.org, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-riscv@nongnu.org, 
 Max Filippov <jcmvbkbc@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, 
 Roman Bolshakov <rbolshakov@ddn.com>, Nicholas Piggin <npiggin@gmail.com>
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

On Mon, Oct 9, 2023 at 9:03=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org> wrote:
>
> When CPUArchState* is available (here CPUPPCState*), we
> can use the fast env_archcpu() macro to get ArchCPU* (here
> PowerPCCPU*). The QOM cast POWERPC_CPU() macro will be
> slower when building with --enable-qom-cast-debug.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/ppc/excp_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 7926114d5c..a42743a3e0 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -3136,7 +3136,7 @@ void helper_book3s_msgclrp(CPUPPCState *env, target=
_ulong rb)
>  void helper_book3s_msgsndp(CPUPPCState *env, target_ulong rb)
>  {
>      CPUState *cs =3D env_cpu(env);
> -    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> +    PowerPCCPU *cpu =3D env_archcpu(env);
>      CPUState *ccs;
>      uint32_t nr_threads =3D cs->nr_threads;
>      int ttir =3D rb & PPC_BITMASK(57, 63);
> --
> 2.41.0
>
>

