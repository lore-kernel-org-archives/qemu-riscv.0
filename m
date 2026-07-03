Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0ACC43458
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 20:51:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfkqw-0007Oz-2Q; Fri, 03 Jul 2026 16:51:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfkqv-0007Oc-4k
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 16:51:13 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfkqt-0001PW-KC
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 16:51:12 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 663KPVuN972875
 for <qemu-riscv@nongnu.org>; Fri, 3 Jul 2026 20:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qQKdqllXVGL1/6Q9AIZ6gYBRgsnjea/46bn0eA8JvRg=; b=c1Gp/ivHvO8H5Oce
 dACfV7RavWU7A3dUInD3Gu0RcSt8K/BpAmP0BNt6K78xMOJ7MyHdbXe+ZVrAEFfj
 Cq8q+s8BpXUmOZUsb4ahEQHg7JGke4EKS85aaROMtfjoPxMBfbB9DOT1vngkZl5j
 gp1cLAHFRY9KMl/8FhE8S3a2rhnsgr0TODXqvXIDbwptO7m3eiTBN1cS2DIel3ZP
 z71ZW3tmZZDNzBHOgEDD7sjegNZF0K8UsQp9ALrmrPeoHeuNlFx8Q8pkQgpKbfMB
 gX+cCJtVyRsRKUfzS3C/8/5f2HNk7XLR0PQslBJ3AAuUZ3N0pfSNBa2k9Zt5eXYg
 LxBJKQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6b03a4c6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 20:51:09 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8f113592bf3so14835436d6.2
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 13:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783111869; x=1783716669; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=qQKdqllXVGL1/6Q9AIZ6gYBRgsnjea/46bn0eA8JvRg=;
 b=ZXVL2RZy6nQ10QRveXjNvZeVaT6oMg+5ccM2jEir/K/kCPw7RaGlF50YMwhNUOlj0G
 Qfae/ibFIBKzbpa1yXkWe6j/0sGJOfU/Fbe2h/xq7/90/VXCQ1gO8HFMWmMeITUFcAG4
 49Bx531069mZYk0wXcohMAn3phTVKkUbw3ULE5jKwleQAEgvN+3WMJ+8kul4r51G1R0T
 OiIIKzyOEL1Zpt95duHy33DE8NTFUgPd9xcw3uvET2ydro4bnoDpWzdQnmPAIckx6N4I
 Y/hQSoiSzHdswNdLNVAuhD/TU5Xd9H6YSGCD4QIjIAzBAqEmaVNWnGDM1Pkd8v+4Jytt
 5Lpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783111869; x=1783716669;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qQKdqllXVGL1/6Q9AIZ6gYBRgsnjea/46bn0eA8JvRg=;
 b=l898GghJdO06BCtLP2zVyXEIZlhlqQ4WnkviVULemjjEVMBbN06BvLO+y1Q0on2DZI
 TdcRRSoPugH05BWV64UX8vazIDC6rYsQjmDf2aBXmlRKPD4XjDxoCURst1lShsi4tR2a
 pIOz7irWJEdMz9jUEWV/c15m249KFbCfoDflS8Hh1cs9H8WUvRvkeCwvV2uoWnZ98Jbi
 6dEWhl0qLfbsh0K5RPIpg0vI53fRAKpzrUylEErUmGgAGcSAV9cOft9xmBvNdJqnn0bs
 nR/4zQDyjXsR+c95tQ5mAQr8kuKqtHOhfnP9FZzuuZX6szZfBFRjYng5AN7zkewYxSdP
 UG4g==
X-Forwarded-Encrypted: i=1;
 AHgh+Ros69IjASGoIzJGyQtWQgF+skR5fNyhrt5iYYQuLl1tWnfTKaAjlBuZvy0ADj9bjcc+QIa8vSjjsLhp@nongnu.org
X-Gm-Message-State: AOJu0Yw8ONMgrztLCkaX/H4tkOg4EmPZme+DaoCvVvru4zCdBOtXhlX/
 5LsvpXoolBfiVav5oc4qlTJnkjn9Y/noaNNtXPZ/B/lfHg1Xwy05jr3xAAxvQwcwKiz+H8+ILsD
 t4RmycngZKZcbA9UJetIl3SrcuMKg/BurWtWLky3Fx6xRaVhzkoE1nVoPuw==
X-Gm-Gg: AfdE7cl3gq6cMTKkG0Hz5UqvTQBE2Le0JChTgtHFqcSRqWrKmjilNv9P3srYjTz/1bA
 j0M/edqo+d4FsVLCVPFgMEuvKr3OUEZSuyBr462jBhrCc2wocgu2drtoHwCG9xwi9iq/gwOmoyL
 ylbMYr9mI3JKri/V7VVAXigYn17gLQZxYo36DzOYn+LGjgEF14d14YjN+vfQaK2av8cmf6oZPXl
 n49XDnMaBy5EE1zWz+fp6+ONP90CW0LYoiR8LoSGG6owMe+AB9A2mKvdPKqxvyJ2eE77ar7ojQt
 VsbBxzD3BvVGictnTC56Vpj7HgniSSZIe3MAP8K+UnlomUTkH464nC9vLE1mPqlmLMux9hF44fQ
 Bm2SHD7yZSabVioctSJrbql86gUI4eYclkeXMqV/PnmtM
X-Received: by 2002:a05:6214:5990:b0:8f3:e0ce:6119 with SMTP id
 6a1803df08f44-8f74a41fccbmr12714756d6.21.1783111869029; 
 Fri, 03 Jul 2026 13:51:09 -0700 (PDT)
X-Received: by 2002:a05:6214:5990:b0:8f3:e0ce:6119 with SMTP id
 6a1803df08f44-8f74a41fccbmr12714416d6.21.1783111868642; 
 Fri, 03 Jul 2026 13:51:08 -0700 (PDT)
Received: from [192.168.68.106] ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8f4724bab15sm62991286d6.43.2026.07.03.13.51.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2026 13:51:07 -0700 (PDT)
Message-ID: <35f0175c-712a-459f-ac37-6264c8b35622@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 17:51:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/7] tests/functional/riscv64: add riscv-server-ref TPM
 selftest
To: Joel Stanley <joel@jms.id.au>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu.zevorn@gmail.com, andrew.jones@oss.qualcomm.com,
 leif.lindholm@oss.qualcomm.com, uwu@icenowy.me,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20260610214133.1882563-1-daniel.barboza@oss.qualcomm.com>
 <20260610214133.1882563-7-daniel.barboza@oss.qualcomm.com>
 <CACPK8XcDX+x3MFLG+XRJVTrocVugoRio06DUsOLJPLA4D4MqnQ@mail.gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CACPK8XcDX+x3MFLG+XRJVTrocVugoRio06DUsOLJPLA4D4MqnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIxMCBTYWx0ZWRfX6deMPTFfHXee
 gk/3SCw1FTOVyQx1bFHWfax5AwXKfIbHY1crotgt3s/8nWqV+HekGVbIssn6Ac7XNjlCOkDlj+z
 8MkJwpemHBbgfkdTy01C1NWTp3HvYT0=
X-Proofpoint-GUID: HcK-5hroDDgz8MtDzM3LDEm1_adBNn5X
X-Authority-Analysis: v=2.4 cv=FoY1OWrq c=1 sm=1 tr=0 ts=6a4820bd cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=9RM9ceTOgqm5Tjxv2ZEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIxMCBTYWx0ZWRfX/Lo/c7vCoWoY
 opQe6QxdobZbL5voh2hmm8IhrJnU5xU8Mh+Vdz1VHcyl2UTczsbWBCoB2TfK+1haW0Qbz1CND8C
 Cc/xrZyYIIZqdxEB/osB4dDEbsGWSmi1VLJytkj4c6+6MFTYUbsnV2siACMNlYXjclveThE4UUD
 7OkQrmSHZj8xOCHNqZD3SUPdY/7F+y1HWFCu0/VQZr1CRksCTh3BYW3din8NEuMQlhyWOUqfR3V
 QAJBIfvVpuszmx5iI16xVZmDIXryeDaEI3Fr7LwpLkAgg6adZYbKNH/1C1s14kCEiqi66gSyXo5
 ygiXOlj53H75Dt8CdkwulI9TK7g/4R8i6zuBJT5OC/IWZv+w21pH7OWD7+5eXXN/BVT/LUxXbFo
 PuvkKUdAMHkyDJcuf5QcdkdlBUaI2VbW4fYdUmkqSvf2F+D4QM8A+dUOmjXoZsciIKYCpIqFfrA
 VKZYpGPuiQAB5SPR4WQ==
X-Proofpoint-ORIG-GUID: HcK-5hroDDgz8MtDzM3LDEm1_adBNn5X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030210
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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



On 7/1/2026 2:31 AM, Joel Stanley wrote:
> On Thu, 11 Jun 2026 at 07:11, Daniel Henrique Barboza
> <daniel.barboza@oss.qualcomm.com> wrote:
>>
>> Add a TPM specific selftest for the riscv-server-ref board.  The test
>> will be skipped if there's no 'swtpm' in the host.
>>
>> The test has been basically cloned from our Aspeed ast2600 friends.
>> Shoutout to monsieur Cédric Le Goater for the code.
> 
> *cough*


Guess there's more people to shoutout in v9 :)


Daniel

> 
>   > commit c3d58a7a26ffbf2ac54ed6d7a3a83f2a7af7159b
>   > Author: Joel Stanley <joel@jms.id.au>
>   > Date:   Tue Mar 28 22:38:44 2023
>   >
>   >    tests/avocado/aspeed: Add TPM TIS I2C test
> 
> :D
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>


