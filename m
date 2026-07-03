Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7970EC43327
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 03:10:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfUIC-00070U-5X; Thu, 02 Jul 2026 23:10:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfUIA-00070A-IM
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 23:10:14 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfUI6-0005xI-JB
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 23:10:11 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6632rZiv2633476
 for <qemu-riscv@nongnu.org>; Fri, 3 Jul 2026 03:10:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4Y23W8xs/BGVitTuP83Bdm7xTIXD/fv5Rp4sk9E/ijU=; b=nERKnjnX/2uBG3OE
 Sdhm8rgX0l4CbpCS433lMoD2Vt6DlZYJw1rH6yUxaB4PwVs89NcvRt3CDJpLW6fa
 DhRnbGaBIuoJ2ZqLGVSW/o1hThJV0gBKUeHKZi1DeOFmaspcer5MAPiOGPTZKLit
 0bo4fyaa5K5BjgHZjQLKwJoRKiLbUsvidMWTe9FcjO42bpdLTi1JBJHo66reF/zd
 +BMw50/s3lORaA0ivMZ1NiKcbPL2mgoHiSCUkx5gKhPMKOTNct5b5rtwOe/a5riK
 cu2d3nc3hYv/yFB09LFHVft+3Y7MRplGdllaHdwqWeunj0hudCry0Za2MCj2ERwn
 GrcnOQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpnj7gd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 03:10:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-92d1cae5939so13578285a.0
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 20:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783048207; x=1783653007; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4Y23W8xs/BGVitTuP83Bdm7xTIXD/fv5Rp4sk9E/ijU=;
 b=axqHreKJgF7FJZtV2eCj+e2kt7pzXmla7pIDGJZcQqqoLE82t4zz4wOnIKNpl71FVU
 ZvpIGlCRZGAGvUWSnXU6CKvYA3mTh5sevMb4tSPcFre0flOA/BMxHLpA6wZ8qr8e+630
 ZYra0grfAMp26kT1R68NpwRQ2L4rqvAPU3wlhCG0ZJ6Q6tRo6jK0WZvlinmZ/OcuPPSp
 r2fx4So9GMi4AeBKsQCYrqD3BRbpXFQvfC/rZuceu9H7RiXMuWJ1PbQwxoTpWgJkg7/8
 fXO+xUExZXfRTU+RkT/H5+2un2giFPvJ0frS7/YKz+JcOjqeqbjhFxMvpSWCgJphM//W
 QBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783048207; x=1783653007;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4Y23W8xs/BGVitTuP83Bdm7xTIXD/fv5Rp4sk9E/ijU=;
 b=XcxuofbwRGmsPKqmR7s/xpVs6XD/Nn6wncrwJPdcFomStR0d5Zo6NSIf7WuKX0Gd+m
 9RJU4v5xIOQ1ZUv/4+eTxdV/qNjAme+zoenngcxkV8pNXCOoDwpKs9bSfNMq7rTyUhVk
 0bTyQnqPAJ8UInwDmrPRj9CJG1/hsAxGaR2KsgLrcxZdeSQ1OZ2OyUpAPc7XsukckugA
 b14KBJIUKtHgO+oe2w91gsSsbjTPg7p8I99NDofe9BjWeAbAoRFP61fbsUQul6PfKNQZ
 poSmIfABJOGqM8wOvlm+MS3LIU1EwiXhAwrEpJwP8GRjdCYS00DwXSmtEYKN1ch7jcgI
 6ALA==
X-Gm-Message-State: AOJu0YzZ1ucln+JiLYjxSvLKfhyqsPVrA8eMOXy5UK/EkUwmuxiditBJ
 S46LCIWcLYZYwjfszcUNkb5BdFIGLPtr0fg8/rW8dbes95xwBOlYDMEbb8qP3NvsffeID50jySz
 Dazg3IJ41bN+vyGjHH1nMJJNQcM3q6br2FABo6K5hFOJXzD60dQP8grbHQA==
X-Gm-Gg: AfdE7ckd7ik7HGMPpreAZGsE8PnFfWmKR2jiRecA2LfWtPPt9fk4zVnVhGJr9e6WByN
 RjXmVd1hB0BhSC2APuSufXMzFcO9UxdwS7NnYxBH/afES9CveyYEk95fHtreRnOI/V7NEIJ4LWL
 yZXNHS/Ey+0hJAsETJ/HQ2jjC4ZCCK820wq2C+1wPuGwVlnbzKGjgICT+/pA/VUJb1ltcKm4pVq
 qOAgjuiMim57IGfPPThkOPt7v+VoyccL0iZrdbAjKTpMT4CAIVeTiK1Kks95+VC3Sabc4CoYuKy
 6Q6BZJLtzDu3TU/W7fappaLuv3nKMLAaEeXjjS8Ye/tIJpJUQDBiAk9p38zseJUqGp/XWODRAI3
 JLfGMIq93EI7s2n1d5cHPatu6skDHbb3fBzMjCHfh9BI9IV4ZpFSmoGt18NhJ0g==
X-Received: by 2002:a05:620a:2851:b0:92e:52df:3523 with SMTP id
 af79cd13be357-92e781dc83emr1137917985a.8.1783048206976; 
 Thu, 02 Jul 2026 20:10:06 -0700 (PDT)
X-Received: by 2002:a05:620a:2851:b0:92e:52df:3523 with SMTP id
 af79cd13be357-92e781dc83emr1137914285a.8.1783048206461; 
 Thu, 02 Jul 2026 20:10:06 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477db3dbb01sm14042627f8f.1.2026.07.02.20.10.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2026 20:10:05 -0700 (PDT)
Message-ID: <d4a4c873-0c7f-4de3-98f7-882f74bfe151@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 05:10:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/24] target/riscv: move valid_vm_* satp arrays to
 cpu.c
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
 <20260702135128.1188021-13-daniel.barboza@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260702135128.1188021-13-daniel.barboza@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SOqx4-NlF7W09ZSA4kw9XUTz5bq6YYm4
X-Proofpoint-ORIG-GUID: SOqx4-NlF7W09ZSA4kw9XUTz5bq6YYm4
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a47280f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=msv8zyevykmUk-OaVhAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDAyNyBTYWx0ZWRfX0JC6YTkVHVVx
 CK+Tm20XATu26H216TSsKl6W5z2YDmyjMLkQUZEBR8MyCEwW6JVJoe2Eq664HubvtTCYZzkWVol
 3PIbtT0+ty1P+OKzRZwsq/2LB5p+yeQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDAyNyBTYWx0ZWRfX+zDqJjOwynUi
 Ug2X+VaU/L6rdkoSlkezJzgv6bECxqpR5KhJ3oTF/dpTxoVMe5euOuAVgH9WhK3J/Z0wRAxwFGk
 eqBia/EnAFu0kydSM2yILTDhAvqaiuwmYlUwaUKoZY3HFoJ4gMV0PmoAVQPfSybSdOhTW0d+RBv
 A56+mhy97qchhl86wodfsN4hRAckaTF13mCDM+dFa6h1P7pTldlyDBwwQXWQMtXqXajRmNEYZUY
 TKN0IlhdMwzOjOO7IPkDS9b2Q7n6RglVsNjp/cdVwS+aRYk5T5GvMCSgSv5/w25I8YUxy/zDoJB
 RBzlS94UBZbiiYhNB7zBsjBqSNkpo5yddjZD07k12Mih2Ejs/YEi1IRiwXJzC1TSvVuJ2FqiDPC
 XC2LBq486aW6QJBTNZBiWKJUteVAJCOjmi1jL8kTUazwGb2CgvXs+9cDRHeKk1H8Lqn+FQ/ch0D
 p32XiAiExU8m3U2YtKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030027
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 2/7/26 15:51, Daniel Henrique Barboza wrote:
> These arrays are used internally in tcg/csr.c and in cpu.c in the satp
> options logic, which is common for both KVM and TCG.
> 
> Move it to cpu.c to allow KVM to keep using it in --disable-tcg builds.
> 
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   target/riscv/cpu.c     | 13 +++++++++++++
>   target/riscv/cpu.h     |  2 --
>   target/riscv/tcg/csr.c | 12 ------------
>   target/riscv/tcg/csr.h |  3 +++
>   4 files changed, 16 insertions(+), 14 deletions(-)

Preferrably before patch #2 "target/riscv: move TCG only files to tcg
subdir" if not too much trouble:
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


