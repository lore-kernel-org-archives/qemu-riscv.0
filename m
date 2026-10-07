Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DA0CA6007
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 10:21:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xEOlO-0008DS-EJ; Wed, 07 Oct 2026 06:20:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEOkt-000833-4y
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 06:20:16 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEOkr-0005tx-Ly
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 06:20:10 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6977jhL91873625
 for <qemu-riscv@nongnu.org>; Wed, 7 Oct 2026 10:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xdnvxDLuV2fnxCVR3GADhRYTlbWm6bym+D+rkcSaU0E=; b=D0ajOLjpOTLvXiK/
 fCyoWaM9gimk6kK/xksD/97VjQFcHnXAuobMj5/9cISW33Jpy1wdgCbIPQJaC+vd
 mUqFkk6pQdc8guTTkUL6hG26sRa935ilh9FicrZlG0Dm21nOmkaALCM5a2W+bnMn
 3f2y3tETey+SHhd5qzR73Xuo0a0Cziosw2NNwl/Jl8HUZDZ7RgjlPkkDfMtiphb9
 sFK2M9pFNSoEW0tWcT9yloCmecEq1x+dblA+BR29Sk3XOA9wFI3CRdN/Ins3mB9i
 yKnvGDTtIyA+IfCeO/ae7kM667FNjl+1p5fCxtawp6eX1vX2k0Z4tPTc3SkVJt6x
 5379Wg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fw8rwvm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 10:20:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93909014c85so662763285a.0
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 03:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791368407; x=1791973207; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=xdnvxDLuV2fnxCVR3GADhRYTlbWm6bym+D+rkcSaU0E=;
 b=Svu0illwf5Ug4SPhB/cUP/+Cd36b1tCn+OhtwoMNMGrqXZA+wWMsMwrAWVf1ei1eGn
 5n9g7WItpu27Uur2hZpvGeebB89qzeXiOubZoKh5YLeopXxro+fje7/PutVIPHYytjyX
 +fkYaQYJOG5J/jOYHBH7oc86yhfsSyLa0OJsMr2Rpdjebfs+IeQmo6opCOptqgzWJzMQ
 ez2yP7VJ+ckI/Yn4i5MX4xQcFpXbCYvWpqmQiD+U+JvCTw+7rTq4sYOk9Jayc85p8vBH
 DTJ+pAQnCMVWqKVGhPZqomv+3XVs5cAojcB3olBDnGZHugPrQoIfHNG4yZK3caYnhT59
 amdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791368407; x=1791973207;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xdnvxDLuV2fnxCVR3GADhRYTlbWm6bym+D+rkcSaU0E=;
 b=nfkEQLpl4jbi6NNQUZJh3AuVr04CXCksZ2UMIt9SiHecHLq1epuM7yUZGCiA6uFWIY
 adZ/kpwpuaIJ175x+vEDmtFzHJUXPVdk4ZFCQLmq8euzYB25254vHXHoHUk1JXi+NQ+Y
 LFpnFndK+9PoQgR+jEkgULXqaDErsr5NeGy2kA169AGgF4c18Mgq0uum9QUhB9mHYpj8
 3+ZmcLD7TtVRKs5/28Pqnk1j1ukn/q38ZgD/8faIq0QwmeHApNaUtzGXR0hf0CzcQxLl
 OtuvinCqOseOX6UfpQ8boPgC/22v2+QbHW+YpsLjcX9aMQ2GahjVp373cSa5tpLsU1zj
 6C+Q==
X-Gm-Message-State: AFuF++mHoRw2coNFW6A8TCu7lkb4GavjfZdrPt/vfWYcQ55ag9nTTIL/
 gCkUdFEZtUU/d7Psr0ad21CFLtKyNkEAP5nvSA2LuKspqrwroFDOdcXOVqyV7V3Fk9bmCgIuGgz
 cHJ64DDgavLwHvVLB/Nvq/+EIbOKxNDVbyTXD6hwkWf2EcuhU0F20+YkwZA==
X-Gm-Gg: AYBFou1VORCbF/iUmSyVZ56EZiiElAkzPctbMdWHdwEjCae1Pfl+wA+xf6VZg4sEhye
 4jcDBewZ5IwJHpOVnrnTdclF4FNo6UUIyma2oS1XURY9nGeG6GwU8Gyb8ep1BqsxuPuffBVhI/i
 ayDpsPAcVhftcyDEiHWiU6SiraW8hjhriv2sB/kxcGM9TUgIcWLfqPGXOK4qvXGAgxTfObnEWDI
 +BsYsotW6wt2M2URuqRnIKWxJIsbelbKaT+tq0KPBierReFc8yt6mL8NxzepH4fG23bhiiV6qej
 /Cb8noEOYOOS3t1847DMwc3I5/c3hsAjzcIke+kb5cf6ARhD0duDHKfy7aez7x3+esuk8DlJ3OR
 GcflSZ0nB7bRNCElvQ+7vFJS6Ggh2GyFvFg==
X-Received: by 2002:a05:620a:4091:b0:93e:4e27:359b with SMTP id
 af79cd13be357-93e9b7760d5mr340006585a.24.1791368406742; 
 Wed, 07 Oct 2026 03:20:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4091:b0:93e:4e27:359b with SMTP id
 af79cd13be357-93e9b7760d5mr340000785a.24.1791368406037; 
 Wed, 07 Oct 2026 03:20:06 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a178c50f54sm132887705e9.10.2026.10.07.03.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 03:20:05 -0700 (PDT)
Message-ID: <6d807b6f-7f14-41be-aa27-673e12209dcc@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 12:20:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/18] target/riscv: cpu.c unconditionally check larger
 MXL
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 pierrick.bouvier@oss.qualcomm.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, luoyonggang@gmail.com
References: <20261007-rv-dedup-v2-0-8a2f0f296a7f@rev.ng>
 <20261007-rv-dedup-v2-8-8a2f0f296a7f@rev.ng>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261007-rv-dedup-v2-8-8a2f0f296a7f@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX4qzdNzluydJJ
 i+TvzimZP2wB2tzmNBJFpA1Dad3QjWaX0IySY3scNqySXhXjoALSdTmnx34b6Gu+NzhbcHUizNw
 dr9e5PHxuh9Dz4bLm/He/g26SKVlQD8=
X-Proofpoint-ORIG-GUID: FniHNUpq9ctM7y_Lz4hbXPKz-4gv4uBP
X-Proofpoint-GUID: FniHNUpq9ctM7y_Lz4hbXPKz-4gv4uBP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfXzVIiEWu165cA
 UjyM3cTUS8SYKc0OFj4EuHCF8qo9hutqWmKFaNrLI04LIjWjo7qbpwmYAufZUdK2ao2jUNrjSVL
 L25OLNR6NSGo44f+bhPqkrtKf6zS5uj02zqaaZuS8d2VdSIPCJ9v21VBZZrjT7kHLbRkrqxzRPg
 3INWyXOAlEWW8dmCCZx4wyqredu+70Etnj0LyxMnBpf0m8I+Y3QpgkBgrywbMQC6XW3bKRNJtZ9
 dYILBxGgfsOtyhhizkv7MEunrxLyivopwJf9C2atwJarCoKz0tBIwHa0z8eSpc0wPfDanQFHzlQ
 reIXg5qFi5j1VK/w1s/0JWPpaaJJGO7y67LNUgJaBasg2ksaHWM7GuDz6G8bkUEHB7oMg2aw/dq
 qYiBHmbTi8a0p4lme9jD72+kn4Q4mY5h+CzJZw95OnV0hpsPHzKAAeoAHZSbF99RNZGhnB/TsbA
 ABdyhRb2LxosEs49ULg==
X-Authority-Analysis: v=2.4 cv=Af0kjHXG c=1 sm=1 tr=0 ts=6ac61cd7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070041
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

On 7/10/26 10:43, Anton Johansson wrote:
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>   target/riscv/cpu.c | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

