Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1286FC61DC6
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 13:27:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wza8b-0007Oy-Ab; Thu, 27 Aug 2026 09:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wza8W-0007Nq-9H
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 09:27:20 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wza8S-0000Hj-VL
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 09:27:18 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67RCBslT856490
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 13:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wBj8BfqgRTIgkQXc/R0vI0zzwDIbwMH+vAutwSU2/lU=; b=BEP7zCg1NuTS31UR
 xp+8Lbj9ss1HepQwR/8lP/3aogwtYGgKwcuWZLfot5MIiPnSiPb8/yIiP392qIhB
 2ExMAWyoFLhRTCS66msrn8IJ4ipqbG7LzB7gdri6YJ5ZA9c/BPgdtT/WKyhtXmcc
 +O7wIRO16qoCibt/xbD3sMupA9QMdWcNmUw8MhNVbVNemRpwGmSQ2dkTwiERZHpP
 0wY/nf8PW2YT7NNf3UjdM6HWi1RCUCU+6MVZ9PN0yLqNnMRsil0mEnnG9l3W2aK2
 d9Vtj3FuS0hLNnQDkpvbm38HmZLr1MH5p0Pdk4uBVlSk4r/aWWV9tu1Sufyio2SE
 CZRKNQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga8m5jx8v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 13:27:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c01ff996dso21005911cf.2
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 06:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787837233; x=1788442033; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=wBj8BfqgRTIgkQXc/R0vI0zzwDIbwMH+vAutwSU2/lU=;
 b=b2OIsDFbrhDRtD8gg6ue8AYMcgEkf96kqSiWvJ5G4SNStoFcGv4IHDpBUHy/a9T9QT
 tBmQe/tfATY4cF8EBhDzISm/UMElk+nzGvDeNu/4iLtYeCafQ4l8EOm6k9T6vYEXOBjq
 SAploANVKzqEgHoUFF7/COQxFyQsQBxJuYA/RKH2pXdN7HWNzf8Ryxx+THc3twzpAZzz
 OTURK4FCEFRl2ugnDVAp1uA2d03nd4WymHU2yGH9DFIoCnePquc7B9iNNt3pl8j6krsS
 Pkf3j9rOcNU6XhyZcHXn47PnqBoUR4HbkW5cRt2VjDwUL0r7oZzSam7Yo3HZRh8smyvt
 YtKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787837233; x=1788442033;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wBj8BfqgRTIgkQXc/R0vI0zzwDIbwMH+vAutwSU2/lU=;
 b=bUqFU+zYuYLEsxQSkPQ1Uhd8eXpoWiHbB93Ea/8ZADJ24MP5bAsaaPJlGLNB1NhYyO
 8DnI0G0MW74kOIdF4WkcrLFc5ZkQmoKIOFy8UlmiQEsiwQOXZAfN3gyV8Ep4N4PX9QNR
 SF6xc5ap8Wf1oc1CovKo44HVfAdjGV13aTvgXzkpiizCi81q89ZAZii5ldUnUQ9GmwZN
 M48Vx0AypHs+uuEO9QflAfYWUSZ8yDL7URppT/kg0iDeJzBrS/loz+Bi8yoKlw/1CSMo
 xEcyLTxWiQa/JwYTV+L/LPeCtbZAHjainf9jTvWFvq9W5D1PrcKEb06ZSTixPLYJ7guq
 rCqg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr3f6WoO91kDDn5GtS9U2Vb80iSOAwMnRbj1qQcdXkw5qntRYYvJDhg4ySHoM7AHzbeJYOcCh8azd1a@nongnu.org
X-Gm-Message-State: AFuF++k00Fva1O9b1DowP49zQiQtfrCKcoH8yXEZ0h8YLKSLavAHz1gV
 LqxG4G9Ovxc3ptI+Tw+K/TFMfZyrUqepCGH8vmB3NznzkIaj+u38yTRj3VxQRjHolq0ado8kMyb
 4bMRrsuwrnGY8NSR0WntkiFUZiM7fZvkejXZOEB1tVyM1OvWgaY7w9zoyAQ==
X-Gm-Gg: AR+sD13uJfEwVsor7fiYyCKWnyDbt/0IcWG8xSmSK5ccFBQ+4NlbZpZHcA+o7hAZonQ
 QIl81B29UjUZeONWNZdRnYR/decYmq+lxasUDCjtS/OTHikWydcWlTfHDwF3uFLNBfVN4KIWvzk
 XEY/WYwDMxFrdnc9skm68Wu2kbwTXabNgG3UxAoyMnyFCH/eKMIwN5bbzbpxf52mPJkXf71oLS3
 QNLG59htziXLGAou8iva7KtOlmAECyDEf5Gw6h8cxD407a2D9NtkGNHfq7uUsK1QfYVG/9QgO38
 xwcr/vkB7crAjRPsds8eQw4n98sKsvT5loduiCdceikohcrs5TzYpTrR+CWhX4y8BiXkRflOyZZ
 U8UrfEKUvM+jknv7Gve5o/PcGGWUXJdy5G4f2
X-Received: by 2002:a05:622a:1aa4:b0:528:3d62:16c8 with SMTP id
 d75a77b69052e-52e4236c9abmr152067141cf.31.1787837232701; 
 Thu, 27 Aug 2026 06:27:12 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa4:b0:528:3d62:16c8 with SMTP id
 d75a77b69052e-52e4236c9abmr152066261cf.31.1787837231976; 
 Thu, 27 Aug 2026 06:27:11 -0700 (PDT)
Received: from [192.168.68.100] ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-52e4270a950sm36574221cf.15.2026.08.27.06.27.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 06:27:11 -0700 (PDT)
Message-ID: <17a3d1bf-b241-4869-973e-dbaea7f9b6d7@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 10:27:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/14] hw/riscv/fdt-common, virt.c: add
 riscv_create_fdt_syscon()
To: Joel Stanley <joel@jms.id.au>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20260826214643.122728-1-daniel.barboza@oss.qualcomm.com>
 <20260826214643.122728-4-daniel.barboza@oss.qualcomm.com>
 <CACPK8Xf44J9SYKc+fXbr5P1S5AgTHzBxsD7pj+VXgmwYXiM=Bw@mail.gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CACPK8Xf44J9SYKc+fXbr5P1S5AgTHzBxsD7pj+VXgmwYXiM=Bw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VOLx__Io21XIrqZIz6TQuG7nthZFLDgg
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDExMyBTYWx0ZWRfX2SPd/Vm5h7Kn
 WYSTeI8ZDmfrCRgSmHSvNKJoDkWTh8qgMQp/EsnRClANp2oO/KQTwLu81GyabKW9GiC+Zfl8/QG
 Ix7WBSRjma6W4Lr7E3znKZmzpOMw8v4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDExMyBTYWx0ZWRfX+7mSLP9+JP7k
 TiQIGoTemFQpvzqyeYtX4mUTWpTlxvx/cyGo2GKZ0YDDDgJxEu1HHDgp7P6LBsd7v8kNufSgSL9
 /aRww6WfQu7oXew9ifzJ8djRlxvXt8uIlShzYWTDtbhoZ/1kAzKBjMx8gwBNzl4tNEtsyrB21ck
 y5+lJ/JBZVrpsxrOpL0UMNtIZZJtyEvoKYSmtKjQpjB2+IMM3k591jcQhwB3+Vx6SSVfVlCvUNz
 Ux33myWsrHQQEzBj2EP1s3Lns28WU6H13op6sA4alwAZhXYtkrnyp0Oq1/UL/OgcdZE0Y17g8DS
 wD+BykZq4IARCb+3riZFgmefJASeSUENKejjbd9WwHlj7gBfM6LwNtOmHo+f5WA+Yp3AdI1wita
 ny33Ny01ka5oIeqXPAjhKPfaE4ZkTJXn54Nev0+yrMzrc9nc7CeVCyUg4Jo+6PjxeKgO+h/Xk2K
 wXwo4kMn3CveJ5RU7Mg==
X-Proofpoint-GUID: VOLx__Io21XIrqZIz6TQuG7nthZFLDgg
X-Authority-Analysis: v=2.4 cv=SomgLvO0 c=1 sm=1 tr=0 ts=6a903b32 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Dh821SomKBAX-c826Q0A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270113
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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



On 8/27/2026 2:46 AM, Joel Stanley wrote:
> On Thu, 27 Aug 2026 at 07:16, Daniel Henrique Barboza
> <daniel.barboza@oss.qualcomm.com> wrote:
>>
>> The soon to be added riscv-server-ref board will declare a syscon FDT
>> similar to what the 'virt' board already does.
>>
>> It won't have a 'sifive,test0' and 'sifive,test1' compat string though,
>> hence we'll add a flag to enable/disable these additional properties.
> 
> Is there a good reason to retain the test0 and test1 compatibles?

No idea.  We have a SifiveTest device in the tree (hw/misc/sifive_test.c) so
maybe there are users for it?

> Seems like a good time to clean them up.

Maybe.  I'd rather have the whole device deprecated/removed first to avoid dealing
with users complaining about "sifive,test support was removed from the DT".


Thanks,
Daniel

