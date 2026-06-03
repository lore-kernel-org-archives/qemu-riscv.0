Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3926ECD6E57
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 01:09:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wUa72-0008ME-No; Tue, 02 Jun 2026 21:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wUa6z-0008L3-Um
 for qemu-riscv@nongnu.org; Tue, 02 Jun 2026 21:09:37 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wUa6y-0001pU-9C
 for qemu-riscv@nongnu.org; Tue, 02 Jun 2026 21:09:37 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-bec354815b9so306426066b.3
 for <qemu-riscv@nongnu.org>; Tue, 02 Jun 2026 18:09:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780448975; cv=none;
 d=google.com; s=arc-20240605;
 b=SDN7i33d7a3cc2/le8vwdm9ql5ThQe6IlZiWCZaWvAMS3TpqXlJ+p1E/TizPBKDF7s
 1l9paNJFoWdS+o8KTWewqLEZraRwf4/1daBLC0Vz7ISOcfIdF7xEdrNJ261dCG9th8bM
 hRCxwGfwSUi5RwHyRe7n++eSCFQfSef9a2CkZcbsqiO8yifJSqciNHRoSvKSlvc+mMsy
 zskzWAyG8gPz87ymv2zdd9Qoiu2CgYcNpdG24z1CSjvc80+zEooytQZlEmBafjZGMmp7
 +yNFKNR6JpXsMfibOc5hzeUGMZMOqJEyu+9/DkqtfQ2dtDv0MNVlD9I3o7fj4IIMq2BR
 Oa/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=asX/jlK2MpSy5TTgDNXQTB+D6EQc+kkLKSHrwBhWD4M=;
 fh=lPuB1E5sEQmVNHhmw1+4w5axwaEvi1bLOcy93GthyrI=;
 b=KBfJYT0b8OlLn0D3rqMAqjQyRqYwRLNTQ/zRoXmRVZ9ZqVNlKcLoySPXqVmUD4nHbA
 BgDyrdXfrFlVn4t1gjg5DegBJAJxQpq0f96+gPqS5WJzYV9rI9v8h+yjUR4+ct5FSjGl
 XiR0lFMO0P3MvxX5GPqy6VTk7z+LMKcXJZjdu5uNbCk3sSLME4O/U4x7lofQcnNIQEsI
 sn1P/1IOqTJiPLAmOs4u7ssxbRuwrpU3u4XKmObYSE0yFU9sQOg/+ex1ImJT9HQqtfoB
 oybry+vn9030mrEOo/n5su75V/0PqdIwAEuCwsw21bZZNeeXDmbzpsYl0FrZ5nP+MyKF
 q5pw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780448975; x=1781053775; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=asX/jlK2MpSy5TTgDNXQTB+D6EQc+kkLKSHrwBhWD4M=;
 b=MJ1HLA0VXEa05zqWW6KRUcyY/4t3AnT+lj2SMtVEThZvVIe/NGkb/z+YO2CKpXoRmQ
 cO8H6HQogeqIfBdrFEoI07qCb8JWsYd8EDkYtgcr4JW7iFlD5VO/Ar5ReQKatr9cscEO
 XwtU+55DJszguHmNhypJNRv7QVq/dfAqucANbczNfn8Kq/aFW9K90YlTjuJNBeQiZYb+
 chWL86i5cPBLEUoSdXMJocFogG50UuL4cOrdUvaNb7E2GOkOemCSJ868ZoroMWIH/Wmr
 /Mi8m9PrJSvcmhoInU48yrONsSVfINyyxtZ4Thv6I93m+vaVBeGuBp6fHWDlfY/rCXoK
 VPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780448975; x=1781053775;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=asX/jlK2MpSy5TTgDNXQTB+D6EQc+kkLKSHrwBhWD4M=;
 b=PesVfB5839eWJO1zHA/GpK3I8mexuz6wEx9Yk37uxnNvQaMyXAur62tZFj0m30sx2k
 ZjwsetMEVo/+FLP+I+1dETJj5nTA0LSJ+TVotw8NTSLavM0tPCzaXtQrx7Tg6nVwEu61
 BLiIduqW7VChbqc8EneAf0fjsdpC1U+t6ALzjMIvH75KgvQxz+5gfV3KzQb9L2yIIaMO
 9xf+hrEwyPVo5b8XYsXbz0AzZjFOdE63PYkTSkZAQR0HN3T6//4OQJ6Rz2aDzDnxA2rK
 /cmou/EZehVph9xkRy4R6AStqkxfzlR4uz+VpKjiVrZDPBcRPt6u+tyvP6l8eAI17v6z
 gkvg==
X-Forwarded-Encrypted: i=1;
 AFNElJ82KOLkiRhGFyhmr5KaOfGBdV63ygWL8C7zxz/28vFhoyb6rcu7PQC7Z+J78cTKUOHC0WtKD8zXM5Qn@nongnu.org
X-Gm-Message-State: AOJu0Yyi6Q1092hzkNRgpuxrDVL9unELM4jMs/WyjUpsAR/YxVzeKn+A
 QMzls9PIqE6o9L8YRKUYv3lovltL/AfWETQTSkVtAFngoip2y4uPbwJuBx171+jcQT994LxqxGz
 8Mtw1nWZq6Jh531VkZg1bne0GwvPoH7Y=
X-Gm-Gg: Acq92OFp8nkC6FDJwMq7iyE39QzOBtf0n5ed+8pC6igYrzwAbyOsV58f1j4qI/AuRyv
 V2V2Aazfr8+rwFSwtHTrDKQp2S4nH0po5f4YxHl+iUUyBXlvSLIABc4lqMgzCMJcYYhAnPUSte+
 7piJuvsMVCF92dZCqz4AWSWTxidf5Ovfb2c4kd2MEPaJa4hWfwFcHUqsiVsBGsGq2FT9J9nvpAw
 D4g9pCwMTEYTEd8k+ZGH6mJszKeZpdJzXFq+vfW5bj29MQPxG5s5PCfcUq4YuRZYPmP9Cy2tqpo
 z+t3bpBfkv+0A7jpx1hfx6kHzFducjSiqGNXbXz3635NdvEf2E3dQd+MAA8=
X-Received: by 2002:a17:907:c289:b0:bee:19d0:dba0 with SMTP id
 a640c23a62f3a-bf0af9fcd20mr34074466b.48.1780448974845; Tue, 02 Jun 2026
 18:09:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260529181848378wiq8pXCmbwAZR5_-wZFJd@zte.com.cn>
In-Reply-To: <20260529181848378wiq8pXCmbwAZR5_-wZFJd@zte.com.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Jun 2026 11:09:08 +1000
X-Gm-Features: AVHnY4Io5xrVgkyHpA6D0d47Ye-m3XMTu9rBJ8oZEHP6VsrR057aT7_qFOhzez4
Message-ID: <CAKmqyKPY6Q6J62jfv-CG6yPFysCHU7Ds1gYCGW0z0GUKPuJAjA@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv/numa.c: Supplement cpu topology arguments
To: liu.xuemei1@zte.com.cn
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu.zevorn@gmail.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x630.google.com
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

On Fri, May 29, 2026 at 8:19=E2=80=AFPM <liu.xuemei1@zte.com.cn> wrote:
>
> From: Xuemei Liu <liu.xuemei1@zte.com.cn>
>
> Supplement RISC-V cpu topology arguments, including support socket
> cluster and threads per core.
>
> Signed-off-by: Xuemei Liu <liu.xuemei1@zte.com.cn>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/riscv/numa.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/numa.c b/hw/riscv/numa.c
> index 24a803f7fa..8a144925c1 100644
> --- a/hw/riscv/numa.c
> +++ b/hw/riscv/numa.c
> @@ -239,8 +239,18 @@ const CPUArchIdList *riscv_numa_possible_cpu_arch_id=
s(MachineState *ms)
>      for (n =3D 0; n < ms->possible_cpus->len; n++) {
>          ms->possible_cpus->cpus[n].type =3D ms->cpu_type;
>          ms->possible_cpus->cpus[n].arch_id =3D n;
> +        ms->possible_cpus->cpus[n].props.has_socket_id =3D true;
> +        ms->possible_cpus->cpus[n].props.socket_id =3D
> +            n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads);
> +        ms->possible_cpus->cpus[n].props.has_cluster_id =3D true;
> +        ms->possible_cpus->cpus[n].props.cluster_id =3D
> +            (n / (ms->smp.cores * ms->smp.threads)) % ms->smp.clusters;
>          ms->possible_cpus->cpus[n].props.has_core_id =3D true;
> -        ms->possible_cpus->cpus[n].props.core_id =3D n;
> +        ms->possible_cpus->cpus[n].props.core_id =3D
> +            (n / ms->smp.threads) % ms->smp.cores;
> +        ms->possible_cpus->cpus[n].props.has_thread_id =3D true;
> +        ms->possible_cpus->cpus[n].props.thread_id =3D
> +            n % ms->smp.threads;
>      }
>
>      return ms->possible_cpus;
> --
> 2.27.0
>

