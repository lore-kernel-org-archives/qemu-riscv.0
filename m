Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D53C61DC4
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 17:49:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzeDz-0001F9-Un; Thu, 27 Aug 2026 13:49:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wzeDy-0001EM-OM
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 13:49:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wzeDx-0003yv-4W
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 13:49:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787852952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=awWB6uB0BedZ29MREFEh7+eImC5cdPwPdJfM9BMb5dE=;
 b=IF2eZsls/RTm8CMitNhytLIcXLaOuHTB0PYZjqSLisYjJAXCCJu6L2pH2keEgqobpckPLQ
 9DP0wA/fePyKo2lLmjhg2LeaQwnBhYYXHsL53fQzi7pXqgEq1OqpgYt3x++V7PY2f7Zs4U
 XAr733whiOFiTI0m88OYC2ZFAxH03/w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-6gTkmVeBMZm81kBGWh6L_A-1; Thu, 27 Aug 2026 13:49:11 -0400
X-MC-Unique: 6gTkmVeBMZm81kBGWh6L_A-1
X-Mimecast-MFC-AGG-ID: 6gTkmVeBMZm81kBGWh6L_A_1787852950
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-47162f83c75so637332f8f.1
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 10:49:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787852949; x=1788457749;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=awWB6uB0BedZ29MREFEh7+eImC5cdPwPdJfM9BMb5dE=;
 b=P9EWq+uT69H07TjM75j5/MHbSV+5zdjkdOBH1Zn9H151Bl7Y+Z5nCjR+JpIeYzh7RA
 Uj0BHNlLSi3KiIr3DoLxAgxn+QNbX4Nx6BonqbNnQ98nNAxkF/PKV1McoeAMiz1v+d5l
 3Ko8dffx0gIh1l1d/Pw7fm/m5CRpvQG0Il5OhD39x2lH/wK7QPBz20GYagyp4pDYXUwD
 isDBEvSbzfhksuA2f3GaZJ1GTrb9fqqYvRQ68nLQInp1RnhwFc/8vp8PWvAk3BIDErza
 ZpR1VHmxBDZrdpsADzmQV7gu8B0RTjyMKj4v+7CU/AHa2GjgNllbx5/JwP5PN4V9aaO0
 AGcQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RojURfyYHjw68oBMGaIyGulhEiDDUkj7p6gNiIE7MrXDzt4BtjVJFsQR0D5M+tvjFDb7q5t+hKsVr3p@nongnu.org
X-Gm-Message-State: AFuF++mAcrVfiLEr19WaG3XowW2P6X32XkydhaDe6HALgknQwV7ZqtkX
 KoWH4C6ROkCwGK2IrXRT9+P93JDhC4IR0UBCoIqKFkXtPojNHWmfYKcI/ANCyCFvb2bFFShxpC4
 QYdhOcFekIUwAUDThHRF8YwEJeI2KUpSPFVR6wVQB6BkToRmxONIrQJl0iw6XVqwJNNai3IbULX
 BC75i6P67CzxoEKG5I+2APgKizy4VJFJM=
X-Gm-Gg: AR+sD12NmNPdnYsPE3Wm4JFypQ4ibq/RGs5EvKndadoT8qVXpUnhH0NaeKXC0ZZxn68
 WZm2cI0i95x8j5PCKd3m/4OJ2PrFtoZu13oMxQ10FkAAFdmwdwI5g46E62xugCU79PydBbMwq85
 HZihhgo6XOf2U26EHiH87n2M8a9cViOAr2dnuZmBBMkzm9Ba+6DJq/TSJiAUCA/lH+b2LD6Riwy
 LHRc0mndDPa52cN0RLjJyCsm8TMAApg3NC2XvK7odUsmls/cQoRvgUbUxnW
X-Received: by 2002:a05:6000:719:b0:474:bbbb:bf17 with SMTP id
 ffacd0b85a97d-482f71ecf61mr1510724f8f.0.1787852949265; 
 Thu, 27 Aug 2026 10:49:09 -0700 (PDT)
X-Received: by 2002:a05:6000:719:b0:474:bbbb:bf17 with SMTP id
 ffacd0b85a97d-482f71ecf61mr1510638f8f.0.1787852948770; Thu, 27 Aug 2026
 10:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260823150731.896-1-luoyonggang@gmail.com>
 <ao7c-FiawF9sMCGj@redhat.com>
 <b2b1d77e-c3e3-4aad-87d2-f5d4834abd1a@oss.qualcomm.com>
 <apAG8JQTnQxRkfip@redhat.com>
 <9e36f8a0-5363-4ce2-accf-62ccf3602344@oss.qualcomm.com>
In-Reply-To: <9e36f8a0-5363-4ce2-accf-62ccf3602344@oss.qualcomm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 27 Aug 2026 19:48:55 +0200
X-Gm-Features: AcwNN1X1-eaT6TIQtq1c9AZkdJJPAFSqmjPm7XfVmNJJCniwRLGMzUtpOIIGOgA
Message-ID: <CABgObfYw8U6q1xdUXcP5XBNTpB-n9MR=DkzFXpb6nkn7g00etQ@mail.gmail.com>
Subject: Re: [PATCH 00/12] single-binary: link ARM and RISC-V into qemu-system
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org, 
 Xianglai Li <lixianglai@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Chinmay Rath <rathc@linux.ibm.com>, Sunil V L <sunilvl@ventanamicro.com>,
 qemu-riscv@nongnu.org, 
 Alexander Bulekov <alxndr@bu.edu>, Zhao Liu <zhao1.liu@intel.com>,
 Eric Farman <farman@linux.ibm.com>, 
 Laurent Vivier <lvivier@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Chao Liu <chao.liu@processmission.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <17746591750@163.com>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-s390x@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 David Hildenbrand <david@kernel.org>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Aleksandar Rikalo <arikalo@gmail.com>, 
 Nicholas Piggin <npiggin@gmail.com>, Cornelia Huck <cohuck@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, 
 Fabiano Rosas <farosas@suse.de>, Aurelien Jarno <aurelien@aurel32.net>,
 Ani Sinha <anisinha@redhat.com>, Bibo Mao <maobibo@loongson.cn>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Matthew Rosato <mjrosato@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>, 
 Darren Kenny <darren.kenny@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qSyYfLbpPPtIQ_8eTigUXiikMUy0Vrq_rmma59iWa7U_1787852950
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Aug 27, 2026 at 6:32=E2=80=AFPM Pierrick Bouvier
<pierrick.bouvier@oss.qualcomm.com> wrote:
>
> On 8/27/2026 2:44 AM, Daniel P. Berrang=C3=A9 wrote:
> > On Wed, Aug 26, 2026 at 11:35:11AM -0700, Pierrick Bouvier wrote:
> >> Seems like the Genius.Artist. in the bottle just need to escape, and y=
ou
> >> can send us a nice series doing all this. Meanwhile, I'll try to find =
a
> >> carpet, a monkey, a princess and a suit to be the next Aladdin.
> >
> > This kind of comment is not productive and disrepectful to the time
> > reviewers in invest in looking at the proposed patches. Please stop
> > this.
> >
>
> The only person wasting everyone's time here is YOU.
> There is not a single person who came on any thread to say "I agree with
> you Daniel", while several posted or commented they were ok with the
> approach here.
>
> Project is QEMU, not Daniel's EMU.

Whoa whoa.

Sometimes people don't reply not because they disagree, but because
they trust the people involved to resolve the problem.

Let me remind you of the discussion we had about -fms-bitfields and
how it was resolved amicably and profitably.

I will read the thread and try to understand what's going on but from
the first impression, "wanting to keep the single-system
qemu-system-riscv64 instead of a symlink" is a valid objection. In
fact, with the proviso that I haven't read the code, I don't see why
you'd want *anything else*.

And especially, "How surprising (:eye-roll:) it is that adding more
code and more classes would result in a higher memory usage, or bigger
binary size for qemu-system" is not a good way to conduct a
discussion.

This project was extremely complex and some disagreements are normal,
but overall I would say it has received support from the community for
years. It is close to the finish line, let's not forget all the
collaboration so far.

Paolo


