Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57D7C77B7D
	for <qemu-riscv@archiver.kernel.org>; Thu, 18 May 2023 15:48:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pzfrC-0004zn-KP; Thu, 18 May 2023 11:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1pzfr4-0004nG-45
 for qemu-riscv@nongnu.org; Thu, 18 May 2023 11:47:52 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1pzfqz-0007n2-Qi
 for qemu-riscv@nongnu.org; Thu, 18 May 2023 11:47:48 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2533a03388dso1533993a91.2
 for <qemu-riscv@nongnu.org>; Thu, 18 May 2023 08:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1684424864; x=1687016864; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A5xnL4oFYlNeI8JkbGRyebJAta2+ap6XwwoYOhgmZPY=;
 b=KxzMHTxdizLAM+xPQDv2bXrmEfX5xSIUPrhihoylWlfj9cOU0uR6QHss7NreckbEAE
 I6+BPpyGmd1uojIZQBPgt+MgG4LiUQWxSa0YnIaWmQF8s/WaMnPgEb4UvGu93wktL7sp
 lSn83AHM+BFH1LQ8qBxnotwa47CmwFiDIvDMjKTVXDGzfXqvabmx6qsZRGnS+RuKucuA
 qy4Hs7/yD3DxZxc/sxXbixnrndrTyMerObisikK6Xbjhd1FFYBGxe0z2nxu+lXWMIvdR
 dZwJAoV6WV3aSnVADpzBHaLIWy+da8LZukTK/laxggkdRYMBkwOMEQpTPzifQYaG2sTR
 9liA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684424864; x=1687016864;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A5xnL4oFYlNeI8JkbGRyebJAta2+ap6XwwoYOhgmZPY=;
 b=BR5dQCS3wEr6RUOSI9CWptKLE3Wh+PazFDLR6ifFkLlE6atr36QhbH/Tn/thA21F+b
 UPOuGWXKE2mmlLqIrkPbm8P4Cp+TWwBqeNUzl+B/S+vDyDBPEDP0WePRBrM31Bjmj/cL
 esSAWYUV2fDBL7BFE9iK2xXXxDEerN21gBXQ3OoSCzMuXU8jaos3nHVUNJVnXBaPCA+0
 j8O1/HErZLOxph9pL85c5Y/MRt/BLOjKvZgRwa1aaGrnjWXz5dnbWZKgP1J9Hbd7VsZA
 0AXYMly52unavNrCAm84aOFM7ebDFixtfeO+3AYiLpoocUYVF0bj65Gl+Hx2vbt0ilaD
 q63Q==
X-Gm-Message-State: AC+VfDyptchCx5dToaDI91ceD/1mSmsoY4dugdfyviHDbPeBw2KdpKOz
 HZpmG6pyGqn/JBVVfefqqSUoPdTNo9hijpN4e/BFEA==
X-Google-Smtp-Source: ACHHUZ4xWEkPIoBx/8IbKGWhjQisR/gnsJbYnjYQqYXEnfeT1VTK2yUfZMludY4bmNQsqd5OAk449b8MEHelZxgrIIo=
X-Received: by 2002:a17:90a:a906:b0:253:2f10:6133 with SMTP id
 i6-20020a17090aa90600b002532f106133mr2589084pjq.22.1684424863985; Thu, 18 May
 2023 08:47:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230518113838.130084-1-rkanwal@rivosinc.com>
 <20230518113838.130084-3-rkanwal@rivosinc.com>
 <CAGKm2NK3+46Te9bFwmyAXkRy3RVXXe61Zz1BYdPaZqxMoJ7HHA@mail.gmail.com>
In-Reply-To: <CAGKm2NK3+46Te9bFwmyAXkRy3RVXXe61Zz1BYdPaZqxMoJ7HHA@mail.gmail.com>
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
Date: Thu, 18 May 2023 16:47:33 +0100
Message-ID: <CAECbVCuMt7MHnRgPS_bo5dqhhEyeeGR11KtwZxQ0YR=Yj3RAag@mail.gmail.com>
Subject: Re: [PATCH 2/6] target/riscv: Check for async flag in case of
 RISCV_EXCP_SEMIHOST.
To: =?UTF-8?B?TG/Dr2MgTGVmb3J0?= <loic@rivosinc.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, atishp@rivosinc.com, 
 apatel@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=rkanwal@rivosinc.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, May 18, 2023 at 4:21=E2=80=AFPM Lo=C3=AFc Lefort <loic@rivosinc.com=
> wrote:
>
> Is there a reason to keep RISCV_EXCP_SEMIHOST handling separate from othe=
r exceptions?
> Otherwise it could be moved in the switch block just a few lines below.

I agree. I will move it to the switch in the next series.

Thanks

>
> On Thu, May 18, 2023 at 1:39=E2=80=AFPM Rajnesh Kanwal <rkanwal@rivosinc.=
com> wrote:
>>
>> RISCV_EXCP_SEMIHOST is set to 0x10, which can also be a local
>> interrupt as well. This change adds a check for async flag
>> before invoking semihosting logic.
>>
>> Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
>> ---
>>  target/riscv/cpu_helper.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>> index 57d04385f1..c78a2a9514 100644
>> --- a/target/riscv/cpu_helper.c
>> +++ b/target/riscv/cpu_helper.c
>> @@ -1602,7 +1602,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>>      target_ulong htval =3D 0;
>>      target_ulong mtval2 =3D 0;
>>
>> -    if  (cause =3D=3D RISCV_EXCP_SEMIHOST) {
>> +    if  (!async && cause =3D=3D RISCV_EXCP_SEMIHOST) {
>>          do_common_semihosting(cs);
>>          env->pc +=3D 4;
>>          return;
>> --
>> 2.25.1
>>
>>

