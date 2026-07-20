Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BB9C44515
	for <qemu-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 11:21:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wlm30-0004Q3-PV; Mon, 20 Jul 2026 07:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wlm2z-0004P5-Hs
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2026 07:20:33 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wlm2x-0006DX-MQ
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2026 07:20:33 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66KAvSPT2421638
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 11:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QSYWmlbPl8jGvur0D30SZgMAigihbsNK0PCztApsFhg=; b=HDnODUF/AGd0BDm4
 b0u+GXcDIHLNfBShYaV59Pr0qOHn68rVfvy5H5L5zqG4kB0k/HseOHo00tMLLczj
 ups4rwCmfRHIAhddUrLj/8or6IqRDS4flFmHLuJ4pUc/SVqL2lxZrQmte+75hC00
 6KSIyHQ9zu4pslhq1cGMtUxsJ6qltGb6y5zxS38sLMIqJe6yuO9Zg91VTNNu74j2
 3RxkvYGm+UmbcCUvCdktAEVn/hKxsWk9+78NlH19wH5VOdyiG6mYM7ZTWBJPj18Z
 Qlra+8eRsXZN5JlphtR09UyB9M9WvoyQtEAF2lj7o5VzNS0yh4lIcKOFGF5j1/JP
 M0mGxw==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfvxgwcx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 11:20:30 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-80cd732b911so11693457b3.1
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 04:20:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784546429; cv=none;
 d=google.com; s=arc-20260327;
 b=X++rWXa8CcFbalihyfWaA4/0M8bga4jtiFVPKwZTHhl/Mb2I1u6NC7s9aEyv359PM6
 5v5e3FzinaBkD1iyyKMph5mCn1Kju+0BaMQsAEewYztu77vCinalcW0MPbIo8PSpnH/7
 BnjivetLudYTDMtRQTeuz2Ybn62Pe9MBrkcX/5FHdX+iSjcC0/O4Rsmfo9UGiF7wENx1
 SGeMcg7Z7Chjy0ToGuQSJJ7CoSM6+rXhKWjMdPEot8oCE0+V5HFnYqLnr6fmTVqGggtJ
 inkSJRgCq4y8O6+pzpaNwVZLraxcP0ficoOCnXLWsElIbKpeHLGSpzRLo6qACHTrkfD7
 LOSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=QSYWmlbPl8jGvur0D30SZgMAigihbsNK0PCztApsFhg=;
 fh=QCwHT8conLSpJb2eMYcM9r0G37LwYBOcdW33WAvzZmQ=;
 b=sRXk3vFU5fJ6AvabK8Gt4t15q3iLo9qp9gVZxN9HzXR9QujBliQEhY/cSIxNeOkh8g
 JLyed1BR2SXOM0+iGziS20cx/3oRtpd9M9o6zMw2kzczhKRhEqhJ4lweThU2/nSDcwb2
 afKVBCdatR7myA6FdqgUvc76O8SkytI+VAIM6RHLh3n3JzO2hI2H9vnX7VnUuyW/ANYr
 eMyrFOac9Mn87hN6eATp4f1D5Csr1wYEV/ic6mJ8UXybJ1SIV9vVjXrKhbVN3O2m0Q5j
 A+5qez0Ka9hzo8qL0CiMM4mjJkosnpc/9HQB6upeoMo729MwBQEaGsJfQ+MykiB+2gp1
 Z+5g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784546429; x=1785151229; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=QSYWmlbPl8jGvur0D30SZgMAigihbsNK0PCztApsFhg=;
 b=VQMcmEeHKzO7hTAt+2H8JzCcXkHU7NJBZpE4OWXNUyb+ZgkoGNQwnWLTZXg5qEJiMl
 /++seupowPm86lFAUHqAATLesOGKuXVg1YRqjCYTxhXVfe0IEu2Y06lpA9zpHF9VnSeP
 b/jRJs0qouHDrpIxmb52IP1BIN1QsgB7WcVDAK6nk8azgMyAAWLFbtSEYVBVuvnKst/C
 tin5CoPQMkYlPFRpZSaidlDnREyKHj8ZCgVfmcZYnaaW3arXr37NGWaIYTqAULzMeC5m
 paGbDS2f7aO7g+8eecoaTPTIqwUlEWx4KbTqSmIzb2PVnieJ2RhYV9xUSC00+BiDGwyl
 mEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784546429; x=1785151229;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=QSYWmlbPl8jGvur0D30SZgMAigihbsNK0PCztApsFhg=;
 b=KWlDxx7Aqb+YjSAZJeQ7xdw22tFOWbqxsr2lgGkhhNUXYypH+MGszawkHWRUekrbCI
 1OytATnXUZyhC3qnBwvCJeYNW9RXFiHwLmEgHY6RdB/0VzLFGUKxw8+gU6S+EGibmQWW
 WTYjwg2lh1lXnxJz9UJ7+uBa8P1vbSEe5m+t51xGZ/UE5aG0KROgOsRyoxFX2e4SaVI6
 4QyUOZsM6DD9n/H82Frs46InbuF8C+eYoKVb2gZi1IbLb2/moeeMILtT4EWuOT6qNjWY
 X/gtnxCrmINwDGqK4BqsjNEOfFu62Xp/CbyPU/NvU+LotvrrPLmp+z7BOihYbkMv6Vg4
 jA6A==
X-Gm-Message-State: AOJu0YyOdYQ5+2AoB0/3a++7Ma4Mhb0Gj9bTtrvGGVcIv/Vyd4Z2xZ1m
 93DYGh/fs4B27hDrX5C//netBrLKKFKePH3CadLC2BlrHZde5G7HJLBuEAZPawp3NwzCnnXzxnh
 BVRKREgRjAZWYIGh5f8ByPC68CJUoNU0qIWw9nAZiVc2EC29y77EuKquT2eZTK+QtPHuOhmmwqN
 W4axcBu+3fgo6kz2uGbOxityd9LJv6it+q
X-Gm-Gg: AR+sD11jZuzrDIkMmoYkY4rwBZvnrKw5OKXcDG+1hQoepd2PxTpI/MacsdrHrrEDOF2
 cdht9nR8elsTkoALvIyquAkw8XTPN0NjA463fCg9HtNaUyz2eFZia/tgdsRrok/5gCs5vXEmZye
 5pxsIanMbQwDDqapZOkGjT5IljMooz4ErSkklq+vgM+dUTiZfK4bJRnJe3mI0=
X-Received: by 2002:a05:690c:660b:b0:81e:c06e:58b1 with SMTP id
 00721157ae682-81f20de733bmr779587b3.1.1784546429167; 
 Mon, 20 Jul 2026 04:20:29 -0700 (PDT)
X-Received: by 2002:a05:690c:660b:b0:81e:c06e:58b1 with SMTP id
 00721157ae682-81f20de733bmr779407b3.1.1784546428623; Mon, 20 Jul 2026
 04:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260714075659.2258023-1-subrahmanya.lingappa@oss.qualcomm.com>
 <20260714075659.2258023-5-subrahmanya.lingappa@oss.qualcomm.com>
 <3118a11c-a5b5-4d03-8059-c8c66bd9b89a@oss.qualcomm.com>
In-Reply-To: <3118a11c-a5b5-4d03-8059-c8c66bd9b89a@oss.qualcomm.com>
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:50:17 +0530
X-Gm-Features: AUfX_mwGApTt9UtMqmqvyylwbUvw5qZOhQz0INZyv9CMH31l70zLl_60LD5UoLc
Message-ID: <CAPxK-6fLE87h-siwUXf5eqZiaZBZndsKD9YDe-60_ZXwxr8_Uw@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] hw/riscv/virt: add opt-in RPMI base support
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-riscv@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=HKLz0Itv c=1 sm=1 tr=0 ts=6a5e047e cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=ItmM5VYfkUr9BNyn6ioA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEyNiBTYWx0ZWRfX8Fy8ky6tLjM6
 7hVchmlC+IiWUp1Xk8TIZTWEznlqm7JjPFafQP19z/0A1N/M1p+LrIrinPO2t02RXajEkLKEWo9
 Txxn5g8rHtY28SK2NhWU53p4kfIN+FE=
X-Proofpoint-GUID: JyEQn6NJ31KmJAuMiGsS6wQqj2MfKXDH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEyNiBTYWx0ZWRfX0BIhkZabDa/3
 ay9UiVOLJW0qqTugjV2HQde4KwXscryHNBKyVg54giW5yaO5zzCOjpPLV1pMwH7sUbjLHvliUJQ
 alFAfUwwN3EWE+qMdK2joTdUV955b+Yif9GNp1h4DA+wkZTD0TuA6I3q1/MJeSpbw4p5nrbH1zy
 q478FczU+QBhamBMFEnRPRKWdUCKCD3WBtS5NCvySPFV5+0zHI8gJfBkkvFJGcfZeyRJA+Tnz6T
 pw4Vv3OVx7AHwRQh5KZbHiE7z/aqL/PXaYnT1w28q+49zWj7/giVasJq/We3nozfe6VxawHXi95
 Glg/XrOWmHREGfHweZyZDnwYXkyfoy1eqCutopDy2a8Yg4rAISKvqV4fbslncKESDbX+1SF/k8B
 kzKJw2XRdmDpSna+sbddl6ZD1TdPkaWdhCTrg+nr7ZPoVl2Yci9bm3HhPUY/P4T1VXPkLgmj3Hq
 qIJo5lESdj76IjWnAnA==
X-Proofpoint-ORIG-GUID: JyEQn6NJ31KmJAuMiGsS6wQqj2MfKXDH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200126
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=subrahmanya.lingappa@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Philippe,

On Mon, Jul 20, 2026 at 4:26=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 14/7/26 09:56, Subrahmanya Lingappa wrote:
> > Add the virt machine rpmi=3Don/off option and wire the initial RPMI Bas=
e
> > transport into machine realization.
> >
> > The option remains disabled by default and requires TCG plus librpmi.
> > Invalid accelerator/build combinations fail during machine
> > initialization. When enabled, virt allocates the RPMI shared-memory
> > transport, creates the RPMI device, configures Base service metadata,
> > and emits the corresponding device-tree nodes for firmware discovery.
> >
> > Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.=
com>
> > ---
> >   hw/riscv/Kconfig             |  1 +
> >   hw/riscv/virt.c              | 96 +++++++++++++++++++++++++++++++++++=
+
> >   include/hw/misc/riscv_rpmi.h | 10 ++++
> >   include/hw/riscv/virt.h      |  3 ++
> >   4 files changed, 110 insertions(+)
>
>
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index 33775a61fd..e52ccfae1f 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
>
>
> > @@ -1410,6 +1452,18 @@ static void virt_machine_init(MachineState *mach=
ine)
> >           exit(1);
> >       }
> >
> > +
> > +    if (s->have_rpmi) {
> > +#ifndef CONFIG_LIBRPMI
> > +        error_report("RISC-V RPMI support is not compiled in");
> > +        exit(1);
> > +#else
> > +        if (kvm_enabled()) {
> > +            error_report("RISC-V RPMI support is not available with KV=
M");
> > +            exit(1);
> > +        }
> > +#endif
> > +    }
>
>
> > diff --git a/include/hw/misc/riscv_rpmi.h b/include/hw/misc/riscv_rpmi.=
h
> > index cb2658e57e..b5d8a32f9b 100644
> > --- a/include/hw/misc/riscv_rpmi.h
> > +++ b/include/hw/misc/riscv_rpmi.h
> > @@ -85,6 +85,16 @@ struct RiscvRpmiState {
> >       bool has_shmem;
> >   };
> >
> > +#ifdef CONFIG_LIBRPMI
> >   DeviceState *riscv_rpmi_create(const RiscvRpmiConfig *cfg, Error **er=
rp);
> > +#else
> > +static inline DeviceState *riscv_rpmi_create(const RiscvRpmiConfig *cf=
g,
> > +                                             Error **errp)
> > +{
> > +    (void)cfg;
> > +    (void)errp;
> > +    return NULL;
> > +}
> > +#endif
>
> Could we use a stub file instead?

  Thanks, agreed. v4 still keeps this as an inline fallback with
  G_GNUC_UNUSED, but I will move it to a dedicated stub source file in the
  next revision.

thanks,
Subbu

