Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587A4CD98D9
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 01:10:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqNjc-0008Jc-LB; Tue, 10 Oct 2023 21:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqNja-0008H7-Cf; Tue, 10 Oct 2023 21:09:58 -0400
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqNjY-00081s-Sq; Tue, 10 Oct 2023 21:09:58 -0400
Received: by mail-ua1-x92c.google.com with SMTP id
 a1e0cc1a2514c-7ab8696d047so2517131241.1; 
 Tue, 10 Oct 2023 18:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696986594; x=1697591394; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pR5z9zdu0dZKgj+qvBJagisnAwc0nesOdy0gVBV0wOw=;
 b=FUGWhI9c/sRjvWVEfMHah/Rb0epmUh1xH0ZyTwQYGzXC49ldywZK/SE0lmtABlcJib
 22GneL09iQQ/jvCpfoD23DwRLnqNhGC6wayV1WGOr8A5uL+LNdD7JYLOMbODvdOZgrP4
 s1RDh4kUAx1STjKcktE5lURp4vcfuCOpwYLigo98Z/HV+ppb7URKmje0WB404c9ngs5l
 DHzDiC0cZ893iCdJ6NIREK9MxilKDveDMr9ltnYUV5mzxTXVyHE++28p1rxEAHr7CVs+
 0l2H3rIBezXSY9ADQbDtx6Fc+Qg8MByjDy1fP8An3Nj5F4LdrGc6tDFPHd1ohAHwfeM/
 ri4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696986594; x=1697591394;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pR5z9zdu0dZKgj+qvBJagisnAwc0nesOdy0gVBV0wOw=;
 b=nciMI+SvSyUKsjakKpKaF9n6IEMs5TqG0rte0ySRE6mKSnic35XFX7+dn/xfxRfupx
 Lrm68LzmXJ5qYpTr5SgJ5pzdrI22z+kK1xkQ9hoUmrJHy+ljpJj49HLBoayoj5oABnNj
 61794tbSvYrW8sAasHaNoIP/HPZWeRfnFoIhbvzxFwnDjpK7Hy7gUtv1nKPNO52PktL1
 KD+gFvrgdBYGfxnzSVLMFQWMNkVRIPZ6aqULhUYrY+MumMi5zOYHeslXbRaqzT8+yADD
 otZsJZvqKHiNY8CUZ6I3uy36tz+Oq1T6iCMKQTOcrXRH51ORcTPSPQpbhcNklR+8qA39
 1ksg==
X-Gm-Message-State: AOJu0YywUCzdn9X2U0SYHVDzE1E50NDMXj3q16q9VeSVeeSO0XmYOoWv
 LP/G7k6qDOWomWmEHi39Ws3Jk3+coDvtZeMZL14=
X-Google-Smtp-Source: AGHT+IGxIV8+Tlhs659REf95Yv3rgY7ufjqN84yopsW4rxTYfC3L7ZXQjmlyes1JXJiNU+7KlUTFuwOCH6grHhZVuIA=
X-Received: by 2002:a05:6102:300d:b0:452:8ad7:4882 with SMTP id
 s13-20020a056102300d00b004528ad74882mr18526073vsa.34.1696986594583; Tue, 10
 Oct 2023 18:09:54 -0700 (PDT)
MIME-Version: 1.0
References: <20231009124859.3373696-1-rjones@redhat.com>
 <20231009124859.3373696-2-rjones@redhat.com>
In-Reply-To: <20231009124859.3373696-2-rjones@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Oct 2023 11:09:27 +1000
Message-ID: <CAKmqyKPdk7TfiLxFkE1wP4YCmxtw5TbaH=sE5aBuEvXwZZFzDA@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: Use env_archcpu for better performance
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, pbonzini@redhat.com, 
 philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92c.google.com
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

On Mon, Oct 9, 2023 at 10:50=E2=80=AFPM Richard W.M. Jones <rjones@redhat.c=
om> wrote:
>
> RISCV_CPU(cs) uses a checked cast.  When QOM cast debugging is enabled
> this adds about 5% total overhead when emulating RV64 on x86-64 host.
>
> Using a RISC-V guest with 16 vCPUs, 16 GB of guest RAM, virtio-blk
> disk.  The guest has a copy of the qemu source tree.  The test
> involves compiling the qemu source tree with 'make clean; time make -j16'=
.
>
> Before making this change the compile step took 449 & 447 seconds over
> two consecutive runs.
>
> After making this change: 428 & 421 seconds.
>
> The saving is over 5%.
>
> Thanks: Paolo Bonzini
> Thanks: Philippe Mathieu-Daud=C3=A9
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 3a02079290..8c28241c18 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -65,8 +65,7 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch=
)
>  void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
>                            uint64_t *cs_base, uint32_t *pflags)
>  {
> -    CPUState *cs =3D env_cpu(env);
> -    RISCVCPU *cpu =3D RISCV_CPU(cs);
> +    RISCVCPU *cpu =3D env_archcpu(env);
>      RISCVExtStatus fs, vs;
>      uint32_t flags =3D 0;
>
> --
> 2.41.0
>
>

