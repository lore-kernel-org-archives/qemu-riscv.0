Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2A1CA5FF1
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 10:36:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xEP0f-0006Sc-LS; Wed, 07 Oct 2026 06:36:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEP0R-0006Is-42
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 06:36:19 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEP0P-0007qV-NE
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 06:36:14 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6977jikc151949
 for <qemu-riscv@nongnu.org>; Wed, 7 Oct 2026 10:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7SAZssxnUkCZ4dx8LfnJ5XRSzguklYmWiWvbceXf0QI=; b=kwPK7aX6jPg/toUy
 wheFYhqcxSL5SjAYSKfMkoNsmAmEeInxKXFn2JhqQGeyr2pvK1Ltqh8MT7AgxvgN
 5dg3uacX2Cy11SVeD8e1lGTi04xDPuQ/UR0JfpCD/IKKv2ujQsvYQGow0otQRCN0
 wqVQcNvBZV47PGKuuAb5k/MfbM+OhpQ06U4fc2xKewjtZOrhiY2L/hYoaE5Hrzpv
 5WW6BtoPrtH9CJEh90oafiS39++O+VAzAnbZaNZt6B2C+7/A4BQP7Wewm00SYVYy
 Lk5gBz/6/vvVwudDNTa7vUnJwAGD+G7H+kU+seGFDCvXIAstDzuMUA0zkY0+U2N0
 EWfJng==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c719p4n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 10:36:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-533928ef33aso51161901cf.1
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 03:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791369371; x=1791974171; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=7SAZssxnUkCZ4dx8LfnJ5XRSzguklYmWiWvbceXf0QI=;
 b=U8cXF1dVDmWo3xrdhwCyhqKZgbxQzAzYZziI8ZVovNMFWiZ58oS3nM+mx95YNhJok+
 OTLS2nz3xiHHkKuvsPA3Wb11Jh6nK+9nEjSAVLcYI3WipE9wcSEtoEiO/Dvct4V0bNYr
 L7q4KVqNslntnMKK9oALm/AkNFtPpy6PzLDG9R8bYv7W5mPnhb9xe8TTmIKC/JanEMH0
 lBuhceZwkDqC0xmlAZaHInTReGQIhAlYAcDd1R2P7sdqTUVXUY3BmlldwWJakzpsgWzf
 GES9yLwA1BhwuDkZ2suJSk0qWMXD9Lzh2ldF+FhvyS2m+nqUV0Y6feIBEHyXVOBG/kQ0
 IdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791369371; x=1791974171;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7SAZssxnUkCZ4dx8LfnJ5XRSzguklYmWiWvbceXf0QI=;
 b=N5HmU3YK1Y8NutsOPixSF4Y8kDeSx5La4+I50fGGYHQPuIGfnuSCaKUS5YEkAAwxIX
 ZVQDQ0TKpvsQTK3+q6ma0Qkb67/nn+VMnQ8hxTchJYyXvLCTd6iJuE/r9IjKrdf55Fjo
 jBdmVQJA4NRTSWJ7H4kgGqjk0bgX6qJqrPO80VLIbEus+IwJeumTHae5JXH3YIsIOppY
 08ZCvkJCq3gokHEFQkkR+aGT2uxxwhlaxpoDnPdBDWnpVV+AZQYU5HO3Uf9x/na9Zi6u
 k7cfGZF36tUBG/kbbwmIilJ699ugjStMfFPXrq/P8Jt+gQJTBgH7o1oxeFgIvoDv2m6w
 s5vQ==
X-Gm-Message-State: AFuF++m/IOEO83WM7AK6Ve0kjQij6kDx8JKESzfM1UkiuFIVGQI1VT+F
 yuieuPXks1bKw/W638a6BUnTGsHevPAOibphIwKWO4lsbeW8/Jbpp9yGqeQ5JtC5XZvFikmKwHd
 ypMj6nI9AYppT1HMBm7XCjdZwHq3VEg0NBu3DRYDLaSywUi6avhLKUrSWlQ==
X-Gm-Gg: AYBFou3k5PvvmMQKs1yOtjkjR6l+WxtgAcSm2deoneOD0qyWs1jr6oSU9fg83lCX7Gr
 wBY3V13b/lLTAZzRBI0+/cRThmiA4n78Cqn0ApcBdG7tQoa7aVxAHUNOLmmaGOtSXxFJgq7enfF
 pMgQLT7fOwb+8EsFd/BEbfxd6WZjTEsDe6SFik56H+jiW7RpLr3ccFcnUV+VXUnzX8Mw6qDhvWI
 +HU7MqCr0NyF9wUCTYY0oP1rryEl90ii5sTumMWVBSHfUefQjv1ebcuvLb4f95S8YI9tytRehkE
 BnCFUuxna8Edx2J4svlCxk4hPmW2wn7jz58VY646EXuBUaJLUXLRWD7ITq77lyreYLVYICYDWHV
 Nxn/ZPbixp2Pl7k3yAkGy/NWOlNn+2R03CA==
X-Received: by 2002:a05:620a:408b:b0:93e:9808:b9ee with SMTP id
 af79cd13be357-93e9b88bf27mr375632085a.83.1791369371039; 
 Wed, 07 Oct 2026 03:36:11 -0700 (PDT)
X-Received: by 2002:a05:620a:408b:b0:93e:9808:b9ee with SMTP id
 af79cd13be357-93e9b88bf27mr375628685a.83.1791369370552; 
 Wed, 07 Oct 2026 03:36:10 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a17f51beffsm62449715e9.2.2026.10.07.03.35.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 03:35:53 -0700 (PDT)
Message-ID: <2b7245fb-e388-4bbe-9c42-8f1f8b0dce7b@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 12:35:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/18] target/riscv: Compile time_helper.c once
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 pierrick.bouvier@oss.qualcomm.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, luoyonggang@gmail.com
References: <20261007-rv-dedup-v2-0-8a2f0f296a7f@rev.ng>
 <20261007-rv-dedup-v2-17-8a2f0f296a7f@rev.ng>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261007-rv-dedup-v2-17-8a2f0f296a7f@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MiBTYWx0ZWRfX2CgjiT3XF32U
 WrttOUphoCpTETq6B4KLjK/QGqzt4ygvRbLrKmU8obDInXaxd0EVl3VuIRH94zrXWco0hJVck5c
 jgM87T/IQQoSoEZc54MvoofuK/t5kWo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MiBTYWx0ZWRfX8D9u4hvIO176
 rCwCR/wWrK5jxDOBjxmlkzFvtWmXENlVkGMy0fH1RNX9S4u/XA1WJP4DJVO73Cze7P4hGq9pttD
 cZlPhTvS6jiufAyEsXzEnOiSlDW+gkKUBAHlpkXf51jazFcmGDOSF5vUyyjv+tIQBnfNkkGXgc3
 GYfkWYoOXCn6z121hvk6+SK7rRchzxyn8A8+ksieq8CtADCUUUkDMtLbJ0yrYHLAHk/4xQqt+AV
 sxj1dQ4zibOb3lkVSDNP0dwG9OXFfeQE7PtUkYHl4073mZuZrCZwz0dkz/kU4mx2mWsBvsKAi+/
 SVyp7kO634ImviDUdcm70Y7GtD8VkGaprXhS4L6Ae7EyNbuE24IOT/htJi30avoY5byCwKULT4c
 UeOcOFeffpKcRtoCLYWvz7NX3OibMWv7LlByM3R8/c2gkOJr8Cal93TrSiv8a9XuAIsT4nBLilL
 CFCysVEDyZ/q74w45lg==
X-Proofpoint-GUID: sxfSCeNbSkGoFleOI_dCX41gQSadzIcs
X-Proofpoint-ORIG-GUID: sxfSCeNbSkGoFleOI_dCX41gQSadzIcs
X-Authority-Analysis: v=2.4 cv=LvYHWXdc c=1 sm=1 tr=0 ts=6ac6209c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=dREDruNvXLWMvVqCjPUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070042
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

On 7/10/26 10:43, Anton Johansson wrote:
> File is already agnostic to target specifics at this point.
> 
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>   target/riscv/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

