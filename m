Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1C7C43458
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 10:56:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wjEK9-0004Q7-GL; Mon, 13 Jul 2026 06:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjEJn-00043k-P8
 for qemu-riscv@nongnu.org; Mon, 13 Jul 2026 06:55:24 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjEJk-0004e1-RJ
 for qemu-riscv@nongnu.org; Mon, 13 Jul 2026 06:55:23 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66D9M1Ef1090406
 for <qemu-riscv@nongnu.org>; Mon, 13 Jul 2026 10:55:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Xn3S2PvtzozBUUcxgsDoJvy0/X/Pjk+r9GG0gXpZTzA=; b=LuZkT2fmn+UMJ46d
 gDUpBDnZL4ygj7XF5a9Cu8rpRrFRcqdHJGU3F+SjoGj8gLkxl0z1h1snlhQggW8w
 gZQm/fmdUCKGRCLXvkKeEpLIdf7HHcXq7n2aR0EdS60SxKxLdX4tQIifyF2/sbFh
 AM6FHtdjx+09NOzfiqDBmCjgOnQzGF0VEXk3mjKOeNMdDZ5IzlwpSmv0arCuEH45
 iace3G28+R44E7Sia1OjRNxWjoHPcbqfrkdTfj/1limULqfY+MnRvF0BsdDfqBmR
 lcarmzV8H+OKZr7B2Yi76qu5pQnhla+oVFsWQyEf1p5UZ37dWOXD8NHS282q7eH6
 rqh72Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwavrau6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 13 Jul 2026 10:55:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c0f0a0760so66953691cf.2
 for <qemu-riscv@nongnu.org>; Mon, 13 Jul 2026 03:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783940118; x=1784544918; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Xn3S2PvtzozBUUcxgsDoJvy0/X/Pjk+r9GG0gXpZTzA=;
 b=dhNHPgav0FEX4+Znbo0LsDSULtm2DH29Ly+lOzh19HoRWdWxos+qnwlGHMZ33dO82b
 IC1wGUfsXzyH1HaTwxgqtaI83V/wnYgOe4dDQfv3CFJPJ41j1FJJBQWLuVIo4bZvPlus
 mAPZnbz0aw0V2dUjdFQHCkz+31q+CtobIE8MLiQMEHlLyZrNTmS3jYzG9J6SNW6AUGZw
 eKAis1zukgQYwAzFF75CUIJbddmjBN5dBwczrD7B2z6RV9KPfJfTP6puGgXezXu4JwMX
 ZWITa++JXJXopjECCGdFmtdPSjEEO3MgcRO8DSytFXkoLq2NNt3wOSRdljE0dzjr9ALB
 lLdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783940118; x=1784544918;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Xn3S2PvtzozBUUcxgsDoJvy0/X/Pjk+r9GG0gXpZTzA=;
 b=cmFLHbbXXAGPXxPrNI4VWrcZSEHBQhKYyuyiN/mrOH3ztGZl3yODAWg4rzPpbmx3jG
 oYJEMSyeWml+jqhrdM4LrupLky8elIpycRY9RiRvQL/a0lyID6sIaiU0KO+FXxsUSiKe
 VsUdmJwD5Wi92wqxfvcAOXqqhz9Fdmu+NMLLYOMKAbKjqr8Hgsq28K+nROrc/18o6d9v
 MVMUgp67K+yb0cF8vVKRUm0vlyHswpJVYCAW87IokWvEv3GTiRGDUWr9dmzvtT9qgiKP
 1lnm2gRiNonkOvvWIOamGNuPJJP3YaywDe6rxkzYygkQat/0ye6bqnH1W+9L3w/LyGnc
 NtQg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpqGCXD4ml4iKdN5ZqU1LNIRh7WVHJSo0KOoRtxQ8/f+VAO0yydDz04Vz5qs3D+MTp263GQfgQImJOr@nongnu.org
X-Gm-Message-State: AOJu0YzY2iNQk4ESw+ZIV1yRwcxDYakvib3Fu/pQr/oYj3ePnQISxZzJ
 K3e7Yizk6CoPi1CxV1KKQfPcXrcYntETmh18HgkzWryNLQQNEkVNNWIaxnkKxFfSKL5oU2kBbhA
 DyAK/f8kQmRNeWqjYmYW8W18TY8rUBRRF/JOVmbcIUZrkTd9zK0ZZoQwIUA==
X-Gm-Gg: AfdE7cnYQlHbC4xswbfPjIotsoZ8SxPBk74QA8eRVCKfuzkrLM/HMuqukJztPxXJqd0
 K19HpNAcv9WmrnN+X+CpCjwG2EPi8qG6agTxnQ5TYz7vtH8ecZyhd1jpnW4UrYsBGD0uCXKFgO+
 +tu7b+0BM03ehdbBd2yOoDbIl3msyNSoTDPavkkyRpky8VsBsk/Yd+hAXUuBEIzUl6WcPnu71r3
 GDIMfIKXvUvAyQqm7qbD3+slHUMVzBR5ppM/M1vH3qBrMTjnK0h1Hd1fSipJNUjmOO3GgFVeXMp
 U2gN5EPfLSLmV942ymsoOzzxLQ6Kp+bJmpfK74QnXJg1R02I67TgNIVoZEAzerylTZx6Fd55ndU
 hTOSTk5W0CTKOQrVpjh/kYD9jYGySVWoUFx84POCGGUb/SH5bsYgSqtM/ITLJFw==
X-Received: by 2002:a05:622a:ce:b0:50d:3e1e:7998 with SMTP id
 d75a77b69052e-51cbf1bf868mr89378451cf.37.1783940118148; 
 Mon, 13 Jul 2026 03:55:18 -0700 (PDT)
X-Received: by 2002:a05:622a:ce:b0:50d:3e1e:7998 with SMTP id
 d75a77b69052e-51cbf1bf868mr89378271cf.37.1783940117742; 
 Mon, 13 Jul 2026 03:55:17 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6ccaf1sm630091325e9.2.2026.07.13.03.55.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 03:55:17 -0700 (PDT)
Message-ID: <63a772b4-caaf-4708-9014-dc40e5b03bcf@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:55:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 003/134] qdev: Reintroduce qdev_new() with a mandatory
 QOM parent
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
 <20260711223707.42139-4-graf@amazon.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260711223707.42139-4-graf@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tsW3fW35DEHxnjy30mkgD7qvU8zLYXEs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExMyBTYWx0ZWRfXxdEc7P+Qib7P
 nVqp+p4NNkdrADTH1q+Rk6B5xUvmTt9qqEb8tca0iz9IOg/i1YU5l68xK+/ZIvTyqfqlU3x3wtu
 m2zktkCE3XA73liCHDPMP3hsQRXkWatb51I0dRWvU2Q7SZyf9EVT/GJgt2CvRVMeo8qhtWzuxP8
 +5CnXtSihijsh3fbXLjNtQR6kyqHdXafVBQoMWDnUrJ4/Iptow3Kk+ugA832HkXL22NlabA1a7+
 YzGayc6HKnYUzS4LYvG95yynO+Y7RFCOu4Zyx2vmL+5oRyAAhGFOxjCQdNpf6quTcfmuGKxg+CX
 jxkr5YNhLwnzSsm8eRjG7MQYMNU89LRjKqWGohFGwls3WHx/W0EAn58+u7vrMSC4fITROK0VGsS
 z+rftEjHKzzU5zOHnxTJ+FABJvcMw74fQZDM28oyVruKsQ1vdnUc2dE9isLKxWTybvfRNWz589t
 00G1rWeRe3dVc2jij/A==
X-Proofpoint-ORIG-GUID: tsW3fW35DEHxnjy30mkgD7qvU8zLYXEs
X-Authority-Analysis: v=2.4 cv=dZSwG3Xe c=1 sm=1 tr=0 ts=6a54c417 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=20KFwNOVAAAA:8 a=vggBfdFIAAAA:8 a=EUspDBNiAAAA:8 a=LfsA7Cq2GQzuzbZ-N0YA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExMyBTYWx0ZWRfX2hYtEX5Fc3lN
 G+H60YA4o1+p+cFt8w5cYvSuRofN+K8QZe2ME6vw8FoAQuHqKXCsnmz55W5GmgR2tcgjDb9Y28f
 2SxuuQb9KecuVXfeDjMEv/D+qO2D2Ic=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130113
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 12/7/26 00:34, Alexander Graf wrote:
> The previous commit vacated the qdev_new()/qdev_try_new() names.
> Reintroduce them with the signature we actually want:
> 
>    DeviceState *qdev_new(Object *parent, const char *id,
>                          const char *type);
> 
> which is the qdev-layer, heap-allocated dual of
> object_initialize_child(): the returned device is created and
> immediately added to the QOM composition tree as a child of @parent
> under @id.
> 
> Refcount contract: the initial reference is transferred to the
> child<> property of @parent, so on return the caller does not hold a
> reference.  Pair with qdev_realize() (not qdev_realize_and_unref()),
> matching object_initialize_child()'s convention.
> 
> qdev_new_orphan() remains for callers that set the parent themselves
> before realize (notably qdev_device_add(), which parents under
> /machine/peripheral via qdev_set_id()).  Later patches convert the
> remaining orphan callers subsystem by subsystem.
> 
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Assisted-by: Kiro
> Signed-off-by: Alexander Graf <graf@amazon.com>
> ---
>   hw/core/qdev.c         | 19 +++++++++++++++++++
>   include/hw/core/qdev.h | 34 ++++++++++++++++++++++++++++++++++
>   2 files changed, 53 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

