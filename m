Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F475C79F99
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 03:26:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3mTk-0002We-DP; Mon, 07 Sep 2026 23:26:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunil.laxminarasimha@oss.qualcomm.com>)
 id 1x3mTi-0002Tj-Eb
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 23:26:34 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunil.laxminarasimha@oss.qualcomm.com>)
 id 1x3mTg-0001qD-Ph
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 23:26:34 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 687NlLmd107470
 for <qemu-riscv@nongnu.org>; Tue, 8 Sep 2026 03:26:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=9j0UveKfPew29zTgQY7NnDUBGQE0tK5aAFfrmn/neCY=; b=Vt
 CfLWPPRddgp0Y3b+vm4PZCwRtjemVfbNfaaktTduHh/m/od8J/MSQSk7Q9khWTxT
 dClJQs5jfJULsIaMDI/CoLPulK9I8tU0qe8Zq4jkSgpAs6/NDxh3wcdc7lamJEs/
 brRNUuinBXUzZnGoSjoTNTLWQ8BRTdSfgPQc154X7m6OdC6MmOwLSnwbVCNTWpTy
 F1335l9Guu8Q/faCFg/MkiPbHqoEt+rDAjjs3yxNmbHCpNDhVviHc/u5u7jgBIZK
 ZCSlG+pG/1khe6A41MndIHvGJMpjDuOdr4XN1pS3cqyVwpnxzcqGU5h4qVGeSAK1
 xLHgl63qwJxdeOfxgbYw==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtty330k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 08 Sep 2026 03:26:30 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-85da2b96c35so76844477b3.2
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 20:26:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788837990; cv=none;
 d=google.com; s=arc-20260327;
 b=cv8OhZSv5fqHXHe1Lx//FSF6x+gLFWfq1G7+H1qsxBigLqGG5cdG8vfVZl8PULZk0L
 AVOPS6GMFOi5Opy3Cy5se6f3pGfFr3gt9PgwexK8dRGvBcKt79CeBTvj4PTXp/LDJeSI
 zbC//dhFaZOj2KgIOG5Srfd/DVpGI7ZSrC4F8BxAW5W0Xf87KrA3pNa4ecm8AunwwpUj
 AGGH/ovyWnpoOCf37JXt+Ms+zhpH61g7G+Co0BemHsGzVIPrUWPpSQOcQvAaVj5e75AZ
 06W5H95VRn9SbfLfYF9iPxHH70DbfDsxHV0b1klI0RBv5dSxeHVLLmhntGVHD9DJGvSq
 UGmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=9j0UveKfPew29zTgQY7NnDUBGQE0tK5aAFfrmn/neCY=;
 fh=j6x/u+4u8bGXW37OnLecmnG+O2NYyhWa+dVwLMWBqAk=;
 b=Rt66Cd8B+fOKTdQi0QfSwDtnUeVzoQ/5CoW0KRzZaldJVpFle2BJAbTKwykCwIu0B7
 JZHm0CtlrYRR2dr6MLdXL93TS+i7KCrM0fids8hQO7qckzr5Jd86T80kHujWF6G7qfea
 pYwW35GEI2stGNJM9QfzX5T2kSJsJW7l1TWVrRXD5ZWijP4XpI5SsFXYuPG9Ug8Slv+x
 pAbkq5RrlFm0kOkxKrUenS98SUNTT+ICG2ly+KjAoFpLqxpzZOTt6yQnulIujP4l8n6U
 phtoKFVTYejbUidfPZ5REyGXo3/BJabRJ7KF3W3erVrSaAr/+Z5FQ1wFqXrxDMXy9Gcq
 1xnA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788837990; x=1789442790; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=9j0UveKfPew29zTgQY7NnDUBGQE0tK5aAFfrmn/neCY=;
 b=YgMkUwrAVMKMGzfkmCTSRbSuwn59PPkpv4gVdmzc3H2y4dT2LpJsu4OepmgqPdWymz
 BPjtV36ldmEZ6Kycfmv2QsXTx686S5Mr5rCEpEuRICdKGXnbLpdRCS8O2p6wr1ddY/gB
 vfkxD7UDjcMzoZNpAdzWyupv5cZIrefTackxIrZGDDpoizKyBPbknrkjYI+JPeukNgdC
 PYk+Dz0bTZYU5+74pY/nBROJClA8UhQ9axqt28NpiAA1GZpb+kPeEc0RJIHVKDl5T91E
 JS94844GyvdmgvkmaQWtJfpjyBzQO5lZ+4/9lpWhbd0Bo9d+1CrRi917cYiPfcJ+3Yqp
 Tx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788837990; x=1789442790;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9j0UveKfPew29zTgQY7NnDUBGQE0tK5aAFfrmn/neCY=;
 b=s5XwPCY3hwRqEm18iUvnaaT9tWs1GQn5Z1CAmps5pWNwSap9ZzOqGINLLanT0nyVp4
 px8NHejuXfvJdECkPw9njCKZwwDoRPc9JyiZjhQiDElhGiSkVvH055nbfbRDNOl0BFoW
 nXLoa9KCEjbqQ53HbFM/mo68BO2DUO8S6hho9KAAUboUtEGXOHmFaAc6FbH5Z4WGHbhF
 PPypmFZJrzomiYQl1i2BBuugsTxC8QbQRuB3Zcuvaa6Irx+kg4vZ3t6LbKZHDx9zbFCA
 sen1f7iSeNS7lZ0ybckWB1i4/FRf//ktnzsb/PTzBQjHinsANwUSE1iaJI4tl6x00Zm5
 SlnA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwc2OZKJBg12PlyJC4CrDCD3DJGbspAslV6WjLnF0I6nnMnKS4mrMBVdKo9uU4QSGTIDK3fSnSjFmxq@nongnu.org
X-Gm-Message-State: AFuF++lR5tsjgkemoci3iXvmMTsjtNdg6Zzyp3clNUlvjj4wsjC4ba48
 1JKEnFSdsltEmQz0K4hqO5ObVD8B5vrjb9JicTOhrh7fF8Ed08KqXHGLd4EDdKy3ZbpZjHaHbN4
 OsUQLg8F/waWQX2uXAjNPOfZaVHaIKuFqhtfqMsgYRGONgJWZHUEq+1pu4BV5Iu0mVqtkwf4rar
 locHFGJj3C7xoluan7MbDvEsqVxxKXId/1
X-Gm-Gg: AYBFou33zMs5Y7poKG8ZZDsXdr15vl1NSh9oDzVhMysTN0ijlX9dEssYFwAanKg4lNE
 Gm8WcGboNppqri0A+rYVMHd7/nrWnpUgr0onEjD84faJOgNBThEYiDZww5i/2P97wCTKZ3Ff5An
 3mBSKeXKc9o5qZdTMZFEwQbVdqTpVNfe5OMV0OzdGW0NAsIjsWXFgKzQpTzTo=
X-Received: by 2002:a05:690e:134a:b0:66f:cabb:d8eb with SMTP id
 956f58d0204a3-670f6f4148amr1054583d50.45.1788837989841; 
 Mon, 07 Sep 2026 20:26:29 -0700 (PDT)
X-Received: by 2002:a05:690e:134a:b0:66f:cabb:d8eb with SMTP id
 956f58d0204a3-670f6f4148amr1054566d50.45.1788837989459; Mon, 07 Sep 2026
 20:26:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260904195610.964829-1-daniel.barboza@oss.qualcomm.com>
 <20260904195610.964829-2-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260904195610.964829-2-daniel.barboza@oss.qualcomm.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 08:56:18 +0530
X-Gm-Features: AcwNN1Vup0mya5WT3-kIqbNd3_cdkqNOWaM6V6w7wNdaDy6RE_Q0RKMFMMr3mPk
Message-ID: <CAB19ukEaJRKHqqW44L2_Ff8NYgcHh9oW1E1w8R9XmcoXsGBOwg@mail.gmail.com>
Subject: Re: [PATCH v10 1/5] target/riscv/cpu.c: remove 'bare' condition for
 .profile
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com, andrew.jones@oss.qualcomm.com,
 leif.lindholm@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=QNBYgALL c=1 sm=1 tr=0 ts=6a9f8066 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=FRSEYCzRAAAA:8
 a=f2ANdWxeLYQbYMvOFHIA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
 a=xVlTc564ipvMDusKsbsT:22 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-ORIG-GUID: hXbPoLFE1i3_LDsOgyxS9N0iPBQ-O_Ap
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDAzNCBTYWx0ZWRfX77PG+o+DY0Ao
 zRFQXsIeEtcczB3A/1FUxpH7pgGVxLbjsdh9XtzTYjMfrvo1vsupuK2RbZDuBKg+tevG9LBPTev
 P4PCILpQst3N9RgqrYIgxalFnk/2TCo=
X-Proofpoint-GUID: hXbPoLFE1i3_LDsOgyxS9N0iPBQ-O_Ap
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDAzNCBTYWx0ZWRfX8ORu8kasKCcZ
 QkRi3ZFh0yo2uG5/tBJGTn/RirRRXPLRUUFyd57q99NusfUAXzXEO3k7EHeXtJyNk/qqxcS2T5w
 edRFq8HLgCdK6PMKBjmHK/t89AhdzN6IWO15mtMyFwnQzYRA9SyX/g5QfBmsThv9cg3kj/s4Xxr
 dOloa3j4/JgZmPG9vnQQTwWbX89gKierdd/xUD9iI42+sz+dO7PY+z40EyUW4DETme5fKxNC0Xx
 tr1o9cB/J8+geV5T8WUuN0/aBAKBqrhWhu32UqiEgMVAkK0HjpzZXozPuomfTbyTlw73aJjZRA+
 WuDYy2aDly8muN/xXGaUrLhPLp0GMXGyO49Cl0zG5QMUTtYzDr4qF+E82w4ygvVnmGvcn2HSw0B
 /8QdKjaQjFiowoeWsELoV7ts0R8ti294020GS1S8BV35KKQDk2FRSjthazuFMxhqAuD//PNzk0h
 UcdiYHR1L9m8vLek6Qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_07,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080034
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=sunil.laxminarasimha@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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
Reply-To: sunilvl@oss.qualcomm.com
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Sat, Sep 5, 2026 at 1:27=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> We want to configure other CPU types to use profiles as an alternative
> to adding every profile extension explicitly, i.e. a profile is nothing
> more than an extension bundle.
>
> This means that a vendor CPU can set .profile=3Drva23s64 while having the
> same handling as any other vendor CPU. Same thing with all other CPU
> types.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Chao Liu <chao.liu@processmission.com>
> ---
>  target/riscv/cpu.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 652311ddef..185474a8cf 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -3096,7 +3096,6 @@ static void riscv_cpu_class_base_init(ObjectClass *=
c, const void *data)
>          mcc->def->bare |=3D def->bare;
>          if (def->profile) {
>              assert(profile_extends(def->profile, mcc->def->profile));
> -            assert(mcc->def->bare);
>              mcc->def->profile =3D def->profile;
>          }
>          if (def->misa_mxl_max) {
> --
> 2.43.0
>
Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>

