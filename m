Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02854CDE00B
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 01:18:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcvDO-000772-Jc; Thu, 25 Jun 2026 21:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wcvDM-00076S-Qw
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 21:18:40 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wcvDK-0005Et-N7
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 21:18:39 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-69806f118d1so626216a12.1
 for <qemu-riscv@nongnu.org>; Thu, 25 Jun 2026 18:18:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782436717; cv=none;
 d=google.com; s=arc-20260327;
 b=EtWU7P5/3t36G9hG3x0ULxWua1M++UU7gzASBA7tfsbY/Pc4OLH1528kFzH0bM9AlY
 W8EvwrQY8L5R919pWNC5vvuAS2GLEUYnTdRwhXihlZ9dOnFmGEWaAquZB06NIpMF2mqO
 VwIKDVGHzbi1tUneOWIHF59MyMDZIVLmQkW9fql83TZz8AOFaFVct5ytrWXosG9k1Rir
 /8U/JMFgQmLQx3HaSFeHwRA5EAJjHiDQ21yIH4ssnGTfpi6ScoIVyC8KCVGyaJkhpTep
 7riGwQjfRJdnKEaRWY0YL45f+XyuQkzbGbxH4Upt/gNOyPPbSIi2ObiSc8x6OeXEZIqJ
 swFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=iVThim7V5qzId7sCg2WID4kqNl9aqLXIaxPlrT23pCg=;
 fh=3egADNZrMrDHXjiw8ZQ0cgvf4Mx03lh2g/D1xnonbYo=;
 b=pPGz7qopjcMFdKHkFW3agSJdEwNMQ7KT+q2QS+IcnmlvH3/uRDxUfGExDcWwmVi3Zd
 WTS20cb6E5uB85aF/2zHwzu8r6ecAetTDZMT5Zx+Ac/1Zpi6hSiJOo65QHTDYue+o0hk
 NmzdDynAzshtnJY5XPOE2mq7CPNFN/BWMq1JGDAV9P5YNz4yWyAZqkN5GRRsmt1kJGMJ
 7fm8SCLLm/JgviNXpTYdF5e6vJEiu17cmEIVpgFsJSmrcy3g3NpJ5JrI0HK6XX1TW9f2
 2wLPIogMmWyPkwgyogMaMsToxQdC4OOFcZaY9NhrrgK9xk7kX9Fd32bDEmBowg/iYVF6
 6Dag==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782436717; x=1783041517; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iVThim7V5qzId7sCg2WID4kqNl9aqLXIaxPlrT23pCg=;
 b=dykUJy3Q7jYBtc+XzvSLi0C3uHg/Ce2zuo2dEaCz0TFuetbzc3PJAoV8AkoT4uON/v
 EUtEc3dSzGh0C/MgnP55DZmKQjNPKRqCtefilgkgQD/tVoXTI5mhBpa5i/irkmQ12TSs
 pL42vIQA3N0Jo7oZLz2le9eJRguVX4jxRbQBEtLUnjCm/UPqvOxn0hafk0jkQm6qVafj
 HwvPm3cj5iG/Ra6YrGEZ+hZlTGYbOwhFB4PcT9wE5wDp7c4Nr6de6TxJukHeN1h1kk4w
 g/dnL5zyNRVKgYmAZlPYSaL3n2DJ4nhcE0vwTHgSOPP5dgFybinyi7WDBIWMi/CKffZG
 rAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782436717; x=1783041517;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iVThim7V5qzId7sCg2WID4kqNl9aqLXIaxPlrT23pCg=;
 b=iAnvDrOANpdIlQuR3c+2QLXBj4QhF3sj6L7FsDt/l8E3v5fV/isv1y+nKT+eDXM+QD
 Fs+aueN/uJPrZj5mKQjYSv+NMxbRmsElMYCXv87Z3sDEjyv5nH68EitJ27QBTBgoDDkA
 AVlsgec3OTXf71vvGGW68y0OVY+qlcPBGFDnZJ6oTw4Cq5sYr2ZFiUZ1SAaD/e3uZcFS
 IfUuwdcVWU4rqYPdUhs58yGBGmObk5OMsZ8yKe7dKTl/n9W0BTisyHeX1+b3d7jK2Siv
 chhPvIhI/NXU6owmwYMihKPkuXkF2cC5FZXgxNmgOhVifNEOoWer/GtIgwoLujdgWLEL
 AIVg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrrdq7+vdZ9S9vnLEttqN/Mh2f6opEmXizJMmXXfkV8Vxja+OcxsOhBqnhb6dH6HrKsj4qccDfTh2lK@nongnu.org
X-Gm-Message-State: AOJu0YzYUde3LZ3fxYrway08DLVo6g71K5y2k3ys4jcTFdgjzTwbdK2N
 xsDTB9tXwemqk/S2GzJtoCdfSGjPBvXcCVlaqcLURRO8rOA6KqcbxAwWzebuDQC1VcwfASpRzrh
 9bGfFZE92nxYUPslXV88hkJCJ7FolwaU=
X-Gm-Gg: AfdE7ck7Z5Kl8iqIq0RnwmKtSb/44+Bws2mxj9BDEsSni0h3YMK0aquAWVRH6J+9CgP
 ozRxMaaOS9rhUKTBhDe/PRGSgqZmeJ24GY/dZSYN5Qum6sb5mFD2MCGXm2DfPtIXaCHE99Msgtg
 ztrgp7VTAc+wRjBLadfE/kov74qq4nGEIHJAiviOiXChi/xGoF4OMBmNisV57K8rWcJIbd9pG0Q
 GyrY7Y/DWiBFbiommIj9SMiwBgW36F5TVAe+xfp0ecPicY9kQ6PGwNyeeNCc6d0MjPei/sAa3Ud
 PJeIB2TrjMPT/NbH5q5kjV15nNg=
X-Received: by 2002:a05:6402:321b:b0:695:37ba:fa00 with SMTP id
 4fb4d7f45d1cf-69810a181f1mr916456a12.4.1782436717138; Thu, 25 Jun 2026
 18:18:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
 <20260624000632.2149359-19-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260624000632.2149359-19-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 Jun 2026 11:18:10 +1000
X-Gm-Features: AVVi8CfcJCjhH9GExaiXSLhXfQ_k7XQADxdGh1NibW6EWznfTG9Xv3c_oM5Qm_4
Message-ID: <CAKmqyKPFciQ_odLwOLVzSxs326RmMma+Ge8qZ=ZXp6zx2ZqkiA@mail.gmail.com>
Subject: Re: [PATCH v2 18/24] hw/riscv/riscv_hart.c isolate tcg only bits
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 pierrick.bouvier@oss.qualcomm.com, philmd@oss.qualcomm.com, 
 fritchleybohrer@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x534.google.com
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

On Wed, Jun 24, 2026 at 10:08=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> riscv_cpu_register_csr_qtest_callback(), vcsr_call() and
> csr_qtest_callback() are all TCG only and are not available in
> --disable-tcg builds.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/riscv_hart.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
> index d1c7188369..747754be61 100644
> --- a/hw/riscv/riscv_hart.c
> +++ b/hw/riscv/riscv_hart.c
> @@ -61,7 +61,7 @@ static void riscv_harts_cpu_reset(void *opaque)
>      cpu_reset(CPU(cpu));
>  }
>
> -#ifndef CONFIG_USER_ONLY
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>  static void csr_call(char *cmd, uint64_t cpu_num, int csrno, uint64_t *v=
al)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(cpu_by_arch_id(cpu_num));
> @@ -151,8 +151,10 @@ static void riscv_harts_realize(DeviceState *dev, Er=
ror **errp)
>
>      s->harts =3D g_new0(RISCVCPU, s->num_harts);
>
> -#ifndef CONFIG_USER_ONLY
> -    riscv_cpu_register_csr_qtest_callback();
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
> +    if (qtest_enabled()) {
> +        riscv_cpu_register_csr_qtest_callback();
> +    }
>  #endif
>
>      for (n =3D 0; n < s->num_harts; n++) {
> --
> 2.43.0
>
>

