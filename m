Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AB7CD98CE
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 12:45:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXemE-00047L-Nt; Thu, 11 Jun 2026 08:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXemD-000473-OQ
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 08:44:53 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXemC-0000Qg-49
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 08:44:53 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65BCSwGh630647
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 12:44:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4bc4dNNWV7PSHolIkjyQRCbQgU9kET4IqKaqlNUEnBo=; b=U23Hpfnih2KqwFrB
 HltJvTPJqkz+JbqJ3XDBZEesNL9+8oYnMPrSSpfmvSsgg2xyMXhWh/pwWaReT39U
 imIrlL5jdaRHUUDu00RhGgqdMrf1353OqO9rgIlgB4QPMemlJe7NU76EyIXHzJDq
 xfOZQG6ve4NTQSPQKp6VfC+rCeS8YLihPeiC//YKrwR3gjIEIj4RN7mpYSdhJl8S
 qJI56JyAue2Ij2Xg7BB2aG1bNnTTXOS4/oFU8mD2f62kLufWrouUI1jlZZ0nm111
 +SMqYRT2lW24QISIClJhZbOebfz51BJNw+44C1UqJPeOeCzT9jiJBwK0rlRAajT8
 jmWiNQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqtb5gq7q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 12:44:50 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8cce1c3c26bso51612936d6.2
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 05:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781181890; x=1781786690; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4bc4dNNWV7PSHolIkjyQRCbQgU9kET4IqKaqlNUEnBo=;
 b=Y0oXG4N+/GKB+dItOLACjps7mm4GlSWCwztuM0iSUC0uJMGseubP1nKHeB4O294NmV
 HcahgLXZdHcMiuBVbUf/s2poRVk4hNw0IAS4kzj01tfpwgPB1ojWOox5keeSDt0U7kY8
 H8Hh/YtuygFfPR/KibykIICMgRt4lEOfLsxHRkzh/pvMSSaDJniFppukc2ALN9+39A4e
 X1vBtJ7AHySZ4lQrRrkb++Lcns3dv5xa7+0XviQZnRYptr3XC0dL+Q8m5ImepSFLyzMW
 2N8NPItmyd7hHgHpm5kaTLDTxOzkaelKMAdRANIGp3//KFOF8+d0Hs/y8UjkbrxqVSiu
 y4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781181890; x=1781786690;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4bc4dNNWV7PSHolIkjyQRCbQgU9kET4IqKaqlNUEnBo=;
 b=kXvVIQuheXz3AUnawyPaDlGfol7AsqQ03ammolnjg74g7AEEv5jQWxylzTAg6/2RiJ
 51LeK61mS2/Ng2Q39yAFa0DJ+iH0Q+wkyr2LRc7OkctF0ZtGbeIlustVSI3UoWa/Msn3
 8d1PHc26CNmTFCFZUZAyDxyGwLnzXEQeBpXnmKmSZVzGkrEitKBx7ji6V70Y6WpSqQOe
 NFqieE98rc7VNXqSj8V+8OffyHst6v/hHq8Ug3DstUc9g57kqg0KqjuR7G0xx0p9E9J6
 AlW48N4N4z4I1viiVJqlZDejZlKQHu9ryD6Weesib18Fb+7+Cdj745hlk1nITf5VQwCE
 8vTw==
X-Gm-Message-State: AOJu0Yx8dKX64QJReahtu0cJRwBsspfLbx496rUBIuV9qLQhdFhTFuOf
 18V4a5ooO6MeP4+2rrWt8Qvsgd8laKf0sfBRP7njK2SK8TuyDPnFF3fZbq+xuSidN3KHWvY5Olv
 pA6+qwZF/OtGNCke7AaS3HcpkmNdJBNXRDX98gwqY4X5GAErIG6NdEAO1sQ==
X-Gm-Gg: Acq92OHyApBdHGTDT9mEbE4Ajyzfsj8u91A2RdXjblH5V4R9cKqZlWYPTzt8ikBOLlU
 8K0N8BUXZryIZVxREl+Me3T8/YAxH1qwtWj2syYX5t0po0YAtXIDnQxH3YJl+7KntryCv35ZLUk
 043c3VAWIGa6E0UyuhuXjy7z2GtBT6yFIXjGrAU6Wm2gVuyC1nv00ggKUMXwjpAIa578Uc+9Gyk
 MBb4Qeqpe/TQrK0ncm7Nw6sIwpMlgYUXKfmQOXt+Q4WXMlOZJdzPW5P3KjqAdMUnphuBMlfmFre
 aa+GDnn1Jbhm7qDkmUO5NZklFguW8VoAJvgd5LeTDP97mydtFkXQUEAcpX48InCeWalKvmYBnwR
 SMnJIN6x7X4CxJ8SAPGfix8WMz8IHy/CuWdmiqydW0MX2Z6vdvNPSfAcQud4pB9M1eckKpTiuJs
 emPn92IUY=
X-Received: by 2002:a05:622a:1786:b0:516:d66e:7b1f with SMTP id
 d75a77b69052e-517ee2336eamr40605411cf.31.1781181889777; 
 Thu, 11 Jun 2026 05:44:49 -0700 (PDT)
X-Received: by 2002:a05:622a:1786:b0:516:d66e:7b1f with SMTP id
 d75a77b69052e-517ee2336eamr40604971cf.31.1781181889395; 
 Thu, 11 Jun 2026 05:44:49 -0700 (PDT)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e5153feesm50541155e9.0.2026.06.11.05.44.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 05:44:48 -0700 (PDT)
Message-ID: <5fe6cc68-4808-447b-aef3-366a0e830434@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 14:44:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] target/riscv/cpu: add CPU unrealize callback
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20260611123412.2135600-1-daniel.barboza@oss.qualcomm.com>
 <20260611123412.2135600-2-daniel.barboza@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260611123412.2135600-2-daniel.barboza@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEyOCBTYWx0ZWRfX39VA3Grrayo1
 gN3nz75aPpOSQYOBc5y7ZnKD1IEJ7JmuR5yL6oQTHgasswi/da0QZKooPfUfj+UdAHPuhUUCppe
 YeKhau8h4U5QYX//IN0bd6KJqutDdg89vyFfb0VfL91vSQEl8IAyKHq2supz+JP9YGNmWqQ3KMJ
 +/OvQf7ZkZJdviIwalVVuRsIRebZBbLxSCRIEJOhAkCfimvU3SR81Gl16bUG0shwIXW96xXT4l8
 maca1h+gk8blvjPZnsloYef4fjPiozcRRbnNbcoZEgNYou5brndFfgf5+HYmMSe1XRGusUumKbQ
 QErBQmdbY10HJkJLniKO2pLPL6gMqVZZ5V/7BCMqbMLpl+xmPi50EplANpsbRuQSCbg8JPDrbyG
 yqBvrqD8xYWj8MmmEtWG2QAORVFtB6s9+S4r5yLSnOXM7ntwd3thTWYxcbnkhUZj/f1O8u9bdTY
 EVrSZySM0+gTL/uXz6w==
X-Proofpoint-ORIG-GUID: CikfTmw4SWdQ6Vr928206KOZPOrPUW0r
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEyOCBTYWx0ZWRfXyKr7jugTjClb
 vO0PA9rGlCwAsLbisGyq126gpM+oKjidaKuBg/MkFpYVKh3a1OKgQuNzhUH/WfTxYsUzIMhWXS5
 54mKt+mnlSGZh7Gm9p8cNQIAj0um3X8=
X-Authority-Analysis: v=2.4 cv=e6g2j6p/ c=1 sm=1 tr=0 ts=6a2aadc2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=1RuTZz-hwFsd0XIn-eAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: CikfTmw4SWdQ6Vr928206KOZPOrPUW0r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110128
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

On 11/6/26 14:34, Daniel Henrique Barboza wrote:
> Next patch is going to dynamically allocate debug trigger arrays during
> realize() time.  We need a way of freeing them during unrealize(), which
> doesn't exist at this moment.
> 
> There's a lot going on in that patch already so we're adding the
> callback infrastructure beforehand.
> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> ---
>   target/riscv/cpu.c | 9 +++++++++
>   target/riscv/cpu.h | 2 ++
>   2 files changed, 11 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

