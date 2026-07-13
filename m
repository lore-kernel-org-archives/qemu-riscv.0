Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63DAC43458
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 08:32:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wjC5O-0005Sb-2o; Mon, 13 Jul 2026 04:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjC5L-0005Ic-Cw
 for qemu-riscv@nongnu.org; Mon, 13 Jul 2026 04:32:19 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjC5G-0002Bw-7L
 for qemu-riscv@nongnu.org; Mon, 13 Jul 2026 04:32:16 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66D6Nf1G731623
 for <qemu-riscv@nongnu.org>; Mon, 13 Jul 2026 08:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hi8jhnrZDSDnDFTwda5WvNX+AK64tJnBvX1SWsEtuWE=; b=pvHdauw4ai/QGbXJ
 iiViqsvc7kajgYnnzp8KMQd4/QqSXE6h0kUcR0JBaPTc1gBNLG5qfcFmT6/Tiy/R
 U29AlK6bx06SkoEhc/aBIBpOBFmC+2qZM1wQDf7ZXnWEYQxzeIDZcFBErLIwA2dM
 tHCEZMozknf8+tCfJZ1zrIRFk2VhdrqClROqQkTt/Ecdi5g5bp8yb1wVENVNU+D+
 QYoVVITTvOmqyCSyBiDSaiOZXw8BTBZGBZqTLhXKfZ/uKY+7geld2D4eO/bZiGMj
 QqwO7O3f/LG5q80CViXiWPkL+e7E8xHk2QfzT1pXeWUvjPTtSqcB3CF9v3++CzG6
 kiFhMA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn39mth-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 13 Jul 2026 08:32:12 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8eec6acbe21so71015316d6.3
 for <qemu-riscv@nongnu.org>; Mon, 13 Jul 2026 01:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783931532; x=1784536332; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=hi8jhnrZDSDnDFTwda5WvNX+AK64tJnBvX1SWsEtuWE=;
 b=QlVkSQGk6UvxJETt1KX25FOVih8micNmoz838VY5XXOQS3nNRYuLhoI5279RKXlPC6
 crxd6OjpZ6BwBeYyzze9XTHE9SNDeYWf66kyBEvaVN6aekO9uqC9grCgWuefCOlnKiTo
 rxKKlP5A5sZNtBCilPiXcqjbyc1Zt0UL5jSYNgjqyXb4CfN1tWf3kMfGmF+6dL2wQ750
 Idy9BF5TUY6RNhOFdOzyy1A3wPa08eu0EyWZafrDgzG/JRB2Es8wrbmugevhTX4tfynj
 JPJ4C7S4GU1dAUKsm2DwzTvfFnsFySkaNC4knVNakuuTYrhlintLJEDnyklPx5fs85DL
 cukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783931532; x=1784536332;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hi8jhnrZDSDnDFTwda5WvNX+AK64tJnBvX1SWsEtuWE=;
 b=qFXguYoFTWRGdWA3oGOuvBPq9yyTt+9hM3FGeCq6Eue7cRpjWkyQPQNm4i0aOzJjMk
 S0C9L1YlrITP7dhQjW8yLgZ0qbjjOkvhAEPCIDQ15M/YjczvKWkN0cBXAHUKt0dvhiR+
 PVAPZg+o9BAsox/lUnN6QH6hg4U1MTLy+jPVD/aHC4b2VwRt0odR9MlfZn6s1Umu9/oT
 DCks9CsEunyzaI0WUbuVqj7roEZiiNE1aMajTV6mnLzwTpddNT1I0WzDtduFA2F1iExU
 yDY/ynAFAiEacMuEO36CE0FJE/ktBFAFpcZLwP15594H3dEGy0HyykVIV2Hscq1pTa6o
 njGA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqndWuzOafR2zP62IJfPNl+kGpvCClOjXPw/A7t/kn0bfo0ueOHNUhjnU2K9ds5s+wo2ONov812rwEh@nongnu.org
X-Gm-Message-State: AOJu0YzHCz8jXLYTGWPTPueD3hr4GaZGRIdE4IF6Aqy5jv2KB0pu3mXM
 gM5UvtF4ku9OGRzUSN6Bo0e//fqBgezOWt9SjwzpxGOL0UDRgNykmmR+o8Ox5J6+uZ/1pZb2YcT
 Yqf3B1Y9BQyqERIh4Qiegmiv0TAXSywzzxLOjM1ZCKXYAdml6CGXguCigyA==
X-Gm-Gg: AfdE7cnhwke7NHNKA5sy3Evk7w2+KkKrvzF8TMZe5xaHQ3wzEhkq21H6FQMMbaFdDwh
 Oaoi7JOge6SiPDEvt3viCQNhNpfL8mbP7Vjwr/qh1Ad5KfauAlPJreeqS/yjNqiDn2qJmRr/gRB
 FqjjvlJJ1kjmdnUem+tNWG0koD2zGQiiT6NnbaAYQ94imf6LtHiWmZ/oeP5u2pWIQzQBVPhjnVG
 1Ji/32w5MJJ1j/RXJeeBMLoluhvqQV7tpOz55t0mOi2yiJZijYb0GN8Z/4vVNDja8jBvsjnnbPx
 momwUisjRDT3fJclJ1JLiqBvWKwxJRa9w4SX8iHHChYgD7U0dC2hepgnqoQ+L+uSK8NAiQ+0Lvo
 VTrF8kShiTcKE8zxkUsznwYxZTmNBK0NV1uZYXEEU3k3R1V2Wn/+29rdK5KG00w==
X-Received: by 2002:ac8:5ad2:0:b0:517:736b:e0c2 with SMTP id
 d75a77b69052e-51cbf146c37mr85250171cf.27.1783931531746; 
 Mon, 13 Jul 2026 01:32:11 -0700 (PDT)
X-Received: by 2002:ac8:5ad2:0:b0:517:736b:e0c2 with SMTP id
 d75a77b69052e-51cbf146c37mr85249891cf.27.1783931531209; 
 Mon, 13 Jul 2026 01:32:11 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493f2e77c2esm211567395e9.2.2026.07.13.01.32.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 01:32:10 -0700 (PDT)
Message-ID: <7706401e-0ac2-4d1b-9056-28909b638916@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 10:32:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 033/134] hw/display: Give onboard devices a QOM parent
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
 <20260711223707.42139-34-graf@amazon.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260711223707.42139-34-graf@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4NyBTYWx0ZWRfX8QCh5kXZWvdF
 TUxsvaoJ4Em/G3HwDS45CjeAEs2eEOqOlFWOR77ZnhwtJnMSyQUh6GlidkZsY+UGLENk4AuJgae
 GY8BzDH03jYdMZI5agqLPzsq5Pvo/PGXSm8aAZp2jND5nN6i6KfOiuh01g4wOZoKxBwRB7ZgWLo
 O59DxJuerj16LlWZUQ2c9Bx/1GU7/ko5Ktev4ZkrYIPD/6gKVhmlxebxPyW2/lf4WKe5WCv71qG
 bhY5chRvcRBaMDFat3ZGge7+RV9jwoJVBDji2hOn36X7W/OUODGIeGzjeYafm+Hf+c2CLs/iFO7
 ypKXvU7mWaEXbAMlfoz1b+RJsRvpj49t/rgTtdAHKjAO2SHqk5hJjfxoRMesI4WW2AFpjqRjRaE
 bC59sNGtIndpmc4kEtIPi8AsmQpiaTyCNeXGBLM1OXUcQOPh4hluS96H26aIzT8iRqMY4D165aG
 mEKOsKBN1F+lSEBmLwA==
X-Proofpoint-ORIG-GUID: Z9bqLptt8C9P3HVhT4EVVsWNv_q_QST3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4NyBTYWx0ZWRfX8VcvXymZMSsi
 yjaq/vpB0oNLqxehTvbzw/grRSQhn8qpLlWQaLZ9CWhbTLBm43x6lv8Y8X4bqW03BbOp/lgdFs8
 Ug/QT0wB6mB4oZAXWcUHTYoaosZqA+Q=
X-Proofpoint-GUID: Z9bqLptt8C9P3HVhT4EVVsWNv_q_QST3
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54a28c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=ZiMIAIO6AAAA:8 a=vggBfdFIAAAA:8 a=EUspDBNiAAAA:8
 a=LfsA7Cq2GQzuzbZ-N0YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=KohFQSMcaiS2QNUyYz07:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130087
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

On 12/7/26 00:35, Alexander Graf wrote:
> Convert the *_orphan() device-creation calls in hw/display to the new
> parented API introduced earlier in this series, so every onboard
> device gets a stable path in the composition tree instead of landing
> in /machine/unattached with an unstable device[N] name.
> 
> The parent for each device is the object that owns its lifetime: the
> machine for board-created devices, the containing device for
> composite children.  Names follow existing QOM conventions.
> 
> Per-site rationale (reviewers: dispute the modeling here):
> 
> hw/display/sii9022.c:167 | i2c_slave_create_simple | OBJECT(dev) | "ddc" | DeviceClass.realize(); DDC slave owned by sii9022 device
> hw/display/sm501.c:1913 | qdev_new | OBJECT(dev) | "ddc" | sm501_init() helper receives realizing DeviceState *dev; drop _and_unref
> hw/display/xlnx_dp.c:1349 | qdev_new | obj | "dpcd" | instance_init(Object *obj); collapse existing add_child+unref, keep name
> hw/display/xlnx_dp.c:1353 | qdev_new | obj | "edid" | instance_init(Object *obj); collapse existing add_child+unref, keep name
> 
> Link: https://lore.kernel.org/qemu-devel/87jyr3w9tc.fsf@pond.sub.org/
> Assisted-by: Kiro
> Signed-off-by: Alexander Graf <graf@amazon.com>
> ---
>   hw/display/sii9022.c |  2 +-
>   hw/display/sm501.c   |  4 ++--
>   hw/display/xlnx_dp.c | 14 +++-----------
>   3 files changed, 6 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

