Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C7EC44501
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 08:35:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wjC7p-0001Bs-Ol; Mon, 13 Jul 2026 04:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjC7g-00016P-NE
 for qemu-riscv@nongnu.org; Mon, 13 Jul 2026 04:34:46 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjC7e-0002Oa-To
 for qemu-riscv@nongnu.org; Mon, 13 Jul 2026 04:34:44 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66D6NetE731612
 for <qemu-riscv@nongnu.org>; Mon, 13 Jul 2026 08:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZfayoF6h0gEMs5Oj/ezHzYISAfGTqjGOW2uBvn0x/OY=; b=GPKUaqPCqmLLy2yC
 4ZcWwRdatVZA3rXPyW4D8F6d7WRgOZXHDyEV0xIU67hJ/EzEG0K9OXKF+YvvaEg4
 3WmXo3uFHOhaaIMyYwPqE5pj7cZOyY4VTKaKz8YBMz68alOB2l4nBJYtWwRThSel
 ToBMUjNc0Un1fLmQDQnLp5aviS9Y8wk5TofbdpS21M27kZB/Z3kVjIyMT6bR7FNy
 TWCs8v28jsugP3WDPm74bUTW14PuGLsurbnPWckAPnEYg7ObEc6ho2CvXmErklxO
 I29a+4uc2TXUmXrBBCd2zurfDF0GVKK9VCyE8K1gREhLxSeDAJqu3bLQXG3oOu04
 CWzBsg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn39n82-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 13 Jul 2026 08:34:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c1e6f602cso57898701cf.3
 for <qemu-riscv@nongnu.org>; Mon, 13 Jul 2026 01:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783931680; x=1784536480; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZfayoF6h0gEMs5Oj/ezHzYISAfGTqjGOW2uBvn0x/OY=;
 b=EuK551pV4kCxdoLgGlZXPCULrV1Ub2qLTg+bxSEx3JUKXgtReGQc9aupnSyijw5CcH
 aQNwB30QS+rpK/m2DgxtiRIll7215tvGwkzf5F9NINOuKdBY+Ka3iSoOCMy5ZqiU+riU
 AMxdceN4PNAySvULV8YYyIv17nTHWhLiXobYiXeQ9y10qix48eEdAu7XyzxmTzTXC7Kf
 WfpjrSvZLIERPOw6Ykc7U8mGXTcA3bLqy0/4MER7dSYQbbeMZq1MlnK9LJnJkaMU9+eB
 eWp6payWbFyEztQ4NpB4Yp7TGD9dhACgH0HEtjsifOFqzFAQWeRsCgnZdMg0EveHpXQf
 6x7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783931680; x=1784536480;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZfayoF6h0gEMs5Oj/ezHzYISAfGTqjGOW2uBvn0x/OY=;
 b=UXzdHovIeKsGER8c3YnnbiTx0t2cAjgjC4tPHuL3Z+U5zKAsfjPA/MuyYI/Lk5lzIU
 XngeZ14YiG3cLdCw/GFevRVS3pufRYLYVTrNbybHAGyVFsfuRnij/G/MPL+KrusUxz9k
 7bCjrT0MVsV5Qb44aoxMkmmpvCMTkzhtz96XJ+Efc7pGEWLO+W+Br6oVn4vdIrTt4kNn
 XaIQJdq7d3qHJJVpygOWHVJ0xu6qCtwh0k7ta0SwRZYJ5X6zoJ2MLwVKYiCKA4CEzIp0
 xUXphGATwe8NKxPx2c1zIGJ4xvklNbBM9p0NwYBjHFpzdZr0vMrJ7ec+8IkSs6aZAtbq
 MliQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr8sd+Lvvjf7+SF2e/dgE1O8YPBUDEFSGFb5qHaRFRiBYmtYoYGl0TUUiX9gzMSgAhGsOQjmXhvAKtX@nongnu.org
X-Gm-Message-State: AOJu0Yxe2Q/wm2xbi2YTUc9bhs64mZA+ZXxnIuRoJMAsCcUhJF+0cF3M
 YQsvfkmcwdah3ilvMQvtSuqGl63rO3FM7vKKzIPX9WhDPWlI2svDJCQkwB9/23DLNWBO4wAta+8
 DqmWz3ceiEXFD8ahWfKpHevcOZXD4/haCutzbmCV0anloJx6FztwBYP1klQ==
X-Gm-Gg: AfdE7cnFZKN0C2GlusaO7f1VijGv+YRkVl/4xtl/TRIzq1tbbcFTIJn9LILgY7EkNYv
 omYiko3crrT2iTQWTHcQfWAJ4/BG1tNZkdYIghrpEKexaNJdB52NColn+Wo87UND/9Gj+nNT7x0
 20kFccWm51Z6kXjMet+zOsEppnvzuZiG9f64CulAsHSSqr5mWp32BlhhAXOt0w5zqlxuxAf++3w
 iwPoBhuNlfNxNWFhLnHdWz9gSwoNOilVIWQDJxG/W6zMR0q6uXfqY7nNfrgVEhFZW27QEod0Yrr
 atWVx4ExAWKg0xlcBZrwZE/UVYvvK2o3FHFWPE3koKcb1vvd8KPqu1MGxwpre2rfSemBRp4apEI
 6oh8KPbegTdHTtis+R4Dkx3aTyO5l5u1LNom8PlmVLy07PSuaLQWDTPSonJf58Q==
X-Received: by 2002:ac8:5e46:0:b0:51c:11ba:c51e with SMTP id
 d75a77b69052e-51cbf276df7mr77121251cf.56.1783931680064; 
 Mon, 13 Jul 2026 01:34:40 -0700 (PDT)
X-Received: by 2002:ac8:5e46:0:b0:51c:11ba:c51e with SMTP id
 d75a77b69052e-51cbf276df7mr77120881cf.56.1783931679614; 
 Mon, 13 Jul 2026 01:34:39 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa039b0cesm85877122f8f.22.2026.07.13.01.34.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 01:34:38 -0700 (PDT)
Message-ID: <d251c63a-b9f9-4c63-9068-bb7dd4f23d82@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 10:34:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 074/134] hw/i386/pc: Give pcspk a QOM parent
Content-Language: en-US
To: Alexander Graf <graf@amazon.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Song Gao <17746591750@163.com>,
 Aditya Gupta <adityag@linux.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Farhan Ali <alifm@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Artyom Tarasenko
 <atar4qemu@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Felipe Balbi <balbi@kernel.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Hendrik Brueckner <brueckner@linux.ibm.com>,
 Chao Liu <chao.liu@processmission.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Helge Deller <deller@gmx.de>, Dorjoy Chowdhury <dorjoychy111@gmail.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Eric Farman <farman@linux.ibm.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, Gautam Gala <ggala@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Jan Kiszka <jan.kiszka@web.de>, Max Filippov <jcmvbkbc@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Jared Rossi <jrossi@linux.ibm.com>,
 Tyrone Ting <kfting@nuvoton.com>, Frederic Konrad
 <konrad.frederic@yahoo.fr>, Laurent Vivier <laurent@vivier.eu>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Bibo Mao <maobibo@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Glenn Miles <milesg@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Michael Rolnik <mrolnik@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Halil Pasic <pasic@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Samuel Tardieu <sam@rfc1149.net>, Bernhard Beschow <shentey@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Sergio Lopez <slp@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Ran Wang <wangran@bosc.ac.cn>,
 Hao Wu <wuhaotsh@google.com>, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
References: <20260711223707.42139-1-graf@amazon.com>
 <20260711223707.42139-75-graf@amazon.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260711223707.42139-75-graf@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4OCBTYWx0ZWRfX2xFJJdDN61iG
 88piywFflX6eh9Ru91vigLShbr2iVDh8qrULpleLr7ZiiVGL5HY5UwwB+93KjUHXBTWw8xrk5mV
 O6R3o9hGD5jOpilYTyx124/1rjtxdPGo7Wu6z4cvcVznCtDI8rtFSpSeXgB8pe+ctkhprjzmPCS
 5mf93fO/6dGGdQ3Sk9qsyBwIGnyVPJiMHtKuvpz1VKV9KpJ9l3VtgoHNEw9MxpuZIgCyiro6STW
 8TCuwHSaypj44Lb6u7iBXkeBmmIGzLRbA2lP6W5DYHpKkxGoFYripgkTuKKxGwZ6M7vdRGr78uk
 UexB4zLDRB58yMbA1u2ZrqYILUgMFEYlWZmJYM6O4vP+E4aDgGyShY9E1eCh8DofIZ/yRFnNQ9X
 7sJxQohuTrYZJsp/FuwhvNqhA4hMLFtRWCllNdpT/3w/aCC7MsmU3ndT/ggyJ2Sl0pkO/Mduec+
 1bwmx1Ub4AwJuJZFA+A==
X-Proofpoint-ORIG-GUID: dhQ9SIAbT8CJtH_Ey9kRUju6OYXPR4Iq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4OCBTYWx0ZWRfX/Y0aw6R6+EpL
 UYRk/6g2F7MleSD9yz6miW/jzqXeEMwtndF3p8es+nYNAMvP5Bpw2lkB7StFYPZfYINIbwzFqcB
 nCH5PJ890qmtomfWiKmZaI69KSkF+SA=
X-Proofpoint-GUID: dhQ9SIAbT8CJtH_Ey9kRUju6OYXPR4Iq
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54a320 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=vggBfdFIAAAA:8 a=KRBWy9jGwUuiBBz3GDoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130088
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 12/7/26 00:36, Alexander Graf wrote:
> pcspk was created in pc_machine_initfn() as an orphan and manually
> unref'd in pc_machine_finalize() when the machine was never realized
> (e.g. -M pc,help).  Making it a child<> of the machine at creation
> time lets the QOM property teardown in object_property_del_all()
> handle that lifecycle for free, so pc_machine_finalize() and its
> open-coded refcount juggling can go.
> 
> The realize path switches from isa_realize_and_unref() to plain
> qdev_realize() because the reference is now held by the parent's
> child<> property, not the caller.

Nice.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

> Assisted-by: Kiro
> Signed-off-by: Alexander Graf <graf@amazon.com>
> ---
>   hw/i386/pc.c | 14 ++------------
>   1 file changed, 2 insertions(+), 12 deletions(-)


