Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CC8C4451B
	for <qemu-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 09:14:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wlk4Q-0001Q3-2m; Mon, 20 Jul 2026 05:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wlk4I-0001Oh-T5
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2026 05:13:49 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wlk4E-0006sD-AA
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2026 05:13:44 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66K76uNA1896128
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 09:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 H45EdT7PJAzojmZrGn7V0dGBEfvxtgTh28DMSwfNTQA=; b=fv6Lep/+4v2hE3RZ
 R6Nhsh10tJuAg2OLAtKUJdv0QL/kv1/UZMQD0i1vcyrfEC5szpew+BchLoSLOX/M
 BmcWsRX8KF3GniVg27JD/5/FCkzkoV4E8STmTOWEcw3h+fLtW5TrAgKtPZeNZOfw
 TjgfRpALTP3C20c+e6wurJFHowsTkBOCJLolG+Vnv9F3e3SxTTm3Q3L6yvD09rkT
 braoteZPh3XgMJhH5xPFvHynmvtecsKqFNi1Ah2WV2m1xKrCWs+Yem5YkUuydjnU
 7lNQ8CUVAHpWWx9aGfdtFxtzboERyXkQ2fLfZiug8RGpWhYKAxyZ1NXP/HGl7kiT
 77RWdg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhf0krkfh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 09:13:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c01ff996dso73186721cf.2
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 02:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784538820; x=1785143620; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=H45EdT7PJAzojmZrGn7V0dGBEfvxtgTh28DMSwfNTQA=;
 b=RjkgQlS9YVX6XT0/m4wPtbj7vo43BDDA1oyEghrpqTSt0eBC3czqxM95EDy6/UcQ4/
 4zg20Sh9ISGHrUNIvUFhSQfmqhV6Dvj4QDWYGXL6+muHZSJaUJX69b2im9ISDm7x/JN+
 J6mRNCXikFgBQa5orObiie9+1pnguDTalcOpl0XgoMhZIk5I6lfRI9XG7Kok9sdtDenv
 XhRNOVwNL5hd9Js/Ac8hO3SEVAi5GVy8gk7mmxbN6+EtMlWQbe9B5dDx2x7IF7irLEHR
 0NmNf9GVPiXRfblVH/IwHBRGV0mxyvayd/n4Fxzgaul+xrgbYlkqKBl7tlIt+AI6utF8
 9nFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784538820; x=1785143620;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=H45EdT7PJAzojmZrGn7V0dGBEfvxtgTh28DMSwfNTQA=;
 b=QXI2Hx8Q/HfhP5sBN4XM2E0ZDy4JSQxTSW9xyu1gbskyHv4NI4AUtm9Ip909oy6ME+
 KtxO7TpU1DNPKnh7zgoe8PtZW4YzHT421bzq2JZgjDuukLXaQDNsBsApunDc4jJzonKN
 dcYGgMSqQZTGBSYzRSlno+cb+QpSKmzp5xH6A9R2v+jMP1jGvCrG1eExCfzBNkryPWSS
 TeXu9alhPvvMHSaey9JizQuu+8YIjozqfSI4GI/EpfmH5Oqry2P6CKRCCFXV5Nk0MqIl
 +1r9zuqy/CnZKto48gZh2JMoDrfpFBVsjFav3ouGJoqyiidzKzyy9UpQU6avTTMzlJGq
 B19w==
X-Forwarded-Encrypted: i=1;
 AHgh+RodZ9az44A6C2mJgCJUSb3rOQmxbE3ROg5IwH1yRXtVKaAoSArXuBAWm3gBXVo3ADY+mQw9P4AOI/zl@nongnu.org
X-Gm-Message-State: AOJu0Yx7LRne14cvKDb6teZt/L0RBfKeFsPqJbz5Z9U4Jv/mXED1qnCR
 GVGGkADZ98Qx+Xtnz4kSGCR78a0KlkEzViqzo3LwtQjwf3/1HCvp+s2EMgeXMHxIhwvCXjoYjT7
 hWTcD6XZXJc0h5QEb2uxX1YCqFW67PT4CSRpb3vOthfkR62BbD1vvMM47mQ==
X-Gm-Gg: AfdE7cmIIZUxi5gWyhR3EkkTv6Od9yoIHDbFaKiedovygjY+ukUuGfuIO9x1wPDH1iw
 WnYWpGqJs5BujZGajTizOBxSyWWSbArVZHvY2C90ja7MudFV+RdgZYYc/FBf9vBfj3wrzUrOjEW
 +n9dk80nyMQg+d60Q2s5+HW1Fwl9R6ZZ7AV5d8z9JF8daqTcoxx0dEimhXS3IbcoikTVt6ZI0Qk
 BPq34/WYN0rjGyNC7PoHYytudRj9i5ikFHJXR/2edyPf9POyvMk0C+acT+zsikBmWuRptuOIS2V
 QeloWR/9FhndtlXviZCNeFL6QbCWWZAcxZ4tekFIXfyJbu3wWpe6udZo3SeWYbwyuRL/NcztRye
 czVxugzNjNkGgnTTNT5+oxUTpYURlHcqoD2/jIs0DgbrNmVrawjw=
X-Received: by 2002:a05:622a:1b88:b0:50b:4491:a2cf with SMTP id
 d75a77b69052e-5213c8dfaa2mr118198511cf.27.1784538820346; 
 Mon, 20 Jul 2026 02:13:40 -0700 (PDT)
X-Received: by 2002:a05:622a:1b88:b0:50b:4491:a2cf with SMTP id
 d75a77b69052e-5213c8dfaa2mr118198331cf.27.1784538819878; 
 Mon, 20 Jul 2026 02:13:39 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f6980582csm21043349f8f.13.2026.07.20.02.13.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 02:13:38 -0700 (PDT)
Message-ID: <7f933602-deed-48fb-b8a5-6a29672fc9c3@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 11:13:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] qom/object.c: introduce
 DEFINE_OBJECT_PROPERTY_SCALAR_METHODS() macro
Content-Language: en-US
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>, palmer@dabbelt.com,
 alistair.francis@wdc.com, liwei1518@gmail.com,
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com,
 pbonzini@redhat.com, berrange@redhat.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20260717135254.508701-1-mark.caveayland@nutanix.com>
 <20260717135254.508701-4-mark.caveayland@nutanix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260717135254.508701-4-mark.caveayland@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: M_5X_pYOHVdRFH6Ls1qNmLEvHQlcT9Hd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEwMiBTYWx0ZWRfX7tNJmHJB0b+o
 PkqWpReA1zDwRx3wVtZfzJnyFYSpAqpG5EvEJtWdvanV+AGwAxQu53IB398G3XNbNtL8pG/gI0L
 ZAbgpok+CemNJHPwLO+EhWpmjAKmkBM=
X-Authority-Analysis: v=2.4 cv=G58s1dk5 c=1 sm=1 tr=0 ts=6a5de6c4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=64Cc0HZtAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEwMiBTYWx0ZWRfX9zruhxEvSZI9
 s4ld93ErZ0i8TesdSQnDvebJQk2DRleUJWbT/usa/MUg+BCQBv0N7v1KRrUA2Dsd0J8TmsgS8Aw
 da9HfMUyjannbIyqQd3ORzgVBQ6t2CgeuvrQzvzWAZhyqzSxlmckq3+0aakD2CEHtRJRVUHE8N6
 i2A9NelAWnpDxkHPj+IXowDQp1tpx/GWI7KtcdornDignrsWx72SYOfdWLui4qFNOauiuDPF6IY
 slFPsbns0EED6MFwhAv8t0c8kq+Xp/TZahLAZmfxPb4k2j39NvJbRxub7a4W9YYJBQkRhqk15TI
 /C1FAM7uQsUsgeA75mT9fJdkt3mtBMCZ0OIzrFA6KHXOg2GOA2DmEQwIVuohzrn9NCFcIPRj8X/
 c5xrFxyXlldRHjACq7xONkoaHpZTuwzIkd0CSJ8qyp8ehKOhaba6QaUyy092aGwGDzccxfK0VYb
 xLXosy6uojGREUB+mjA==
X-Proofpoint-GUID: M_5X_pYOHVdRFH6Ls1qNmLEvHQlcT9Hd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200102
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 17/7/26 15:51, Mark Cave-Ayland wrote:
> This macro defines both the QOM get and set functions for the given scaler
> type. Replace the combined use of OBJECT_PROPERTY_SCALAR_GETTER() and
> OBJECT_PROPERTY_SCALAR_SETTER() with the new macro.
> 
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   qom/object.c | 19 +++++++++++--------
>   1 file changed, 11 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

