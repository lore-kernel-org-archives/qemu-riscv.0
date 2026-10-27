Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F35E606A31A
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 18:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mD8CnZgQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AgyqD6Lm
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLlsf-0000UK-VV; Tue, 27 Oct 2026 14:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xLls6-0000Cz-Bv
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 14:26:11 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xLls4-0004zY-OQ
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 14:26:06 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69RIHr622960671
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 18:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sBoNYG2/VLOCXr5s8H72Fe6tRbiTjTU85h25ejei/N0=; b=mD8CnZgQxE1oa5j9
 qoKXWXheKVZzLxGFCQd69cVdXqPCuWdkXjtlYVB1vx1TpHS4ssqwqthhF4DWGHJ0
 pvrzS9FXFH9ZIjGLBLuPqbb6Qa23faQ7wjIwvQ0CHr4TVyUctIEUdCjtiGeh27fp
 UUCi0qykQM2tjuwixbr2fuk2AVp/UwYUVoZ8+gduFzvLxTBKdLpC6pR3tM/7q2C4
 XAS+3ilcyVcxwQQxbWc/6VcuUbkm567kosgeRC1AOdYsVsLteX89eCWUAAW1YYJG
 2xB17lmoRe6Wm2/gtcgLnzc5MVnPDGHTJR3QXJpWzv/WiTRrUzm7DDu0VkE1g2zK
 HkMDrg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy670mvy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 18:26:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93cb71b1443so14214185a.2
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 11:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793125561; x=1793730361; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=sBoNYG2/VLOCXr5s8H72Fe6tRbiTjTU85h25ejei/N0=;
 b=AgyqD6LmeFG4/I8N6+He2XK81KUMisIupR6LpYII8/XUMfVfKzKNTM1ZI5Te7xzV5d
 U1J4y8ccEE/bPD+4BSej7CarkiLHjzHt7OrUeJyvYCpxPj9rSZnl+EN4NHrYnb99roqz
 GRh+OELCwQgkO/9Y5wODDoSRjoqfh2NtWLPNhviPQnnkt4yrgZJbtHV5YsKeKlKt68ER
 zhLdxP7OZsA710yCLkD/56s8pu9Wyd31tFSuVPOu0NobiBYXmPrkl7ACVvSgLbjf2q59
 9HfxD+mF312Hr3/vZPv8uINRMmCSPtU+mhi2B5xVFhvf0TgwUCxHUXZHFavXB17aCkqU
 6MPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793125561; x=1793730361;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=sBoNYG2/VLOCXr5s8H72Fe6tRbiTjTU85h25ejei/N0=;
 b=dwBf2S0whfAwGWPaaIP/9RdvxROYT5aKCLZ/pRA6wRSjPvTzVb+kcNMr5uY1MaIsyz
 E+OrQS4/GY+BS9rTJBg+bA9iqLoz0v1RLLKbUUOhOfsDNfrVd2HtbyXgmXhStrH0tCzC
 iZNWQrWEoxWomNdE0kb5u/IJNcbPhXovnR1PqcCw8Bk9znW9LRgi1wegStKECChHSPsQ
 H25vLI0eduEiNlS44sW/ncIqXvr6JuDl+KHXmrcBc15xGRzh5Kec93eWLKPYYMrhk/FJ
 jXjEljSYcWJgcwnaUBKNLqSQD4HtDMr5uuRw4YuuNgEU4enXeCbw5MuG2lIxb3V7sJqM
 Kq6A==
X-Forwarded-Encrypted: i=1;
 AKwUvBx2DvQYZmVpOhIwME2wEujRjhMTX2slb8kneLYeDBhNIh5Mfqg6l0PqCr+zL9bioBIl5Cn5G2MywHzO@nongnu.org
X-Gm-Message-State: AFq9FYLAvTewvmFQ90d22DjQq0ZPy+DWYlCiEG15O7IVokQm7Fmykj6y
 k7BBYG0zbvdD1qQAVS9+mPnZN06YtsgTczyvbWwHlNyykzwWYtSTlZa7eUS2BB2sJwhLuSD/6od
 2kgISkBQFKoDovzhxESj4BwYIB++EmLK+xcgvN+HJN01epUNAtWTPN6iMUg==
X-Gm-Gg: AYBFou2ChkUZuKuHYWg/1qr0zLzLrvg20227xJqkKJQDIB+nMuvQyNDlMxpmxB6+tk7
 /Y0umwz8K/aszGusTHqUypvOKJJ7q+eh4OShvHZGbJkDfoukPAdteCJpZblF5k7544I1VUV1kWd
 qGl/7t2uxPdCpNn31tweKyNVtUFwQyoSs9UkIM2aQvsnNunVs2Ycwk7bbvt5DTseq/R5Cly3umC
 wKGENhsGcUSzvE1TSVxT3f/uOCU4NPO2I5zyqAel8DJF/Da6e1YYOq3rOsAx6Rs/VD0fOMkCZ3q
 NdleJgIYk3aJdOe538S0RLmmTXMWN70W/S2omeRQ843mZiOW9Jabmw9h99gcLMnL3SS+o9wp+w0
 I2C9S0Jv9IIMd4vb5cmHlL+n5aaTxkxlvlvEAqefSfcFC+tsqfw==
X-Received: by 2002:a05:620a:1b98:b0:93c:6f0e:8468 with SMTP id
 af79cd13be357-940ef8f0788mr1681987885a.43.1793125561028; 
 Tue, 27 Oct 2026 11:26:01 -0700 (PDT)
X-Received: by 2002:a05:620a:1b98:b0:93c:6f0e:8468 with SMTP id
 af79cd13be357-940ef8f0788mr1681982485a.43.1793125560576; 
 Tue, 27 Oct 2026 11:26:00 -0700 (PDT)
Received: from [192.168.69.229] (82-67-153-177.subs.proxad.net.
 [82.67.153.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a94c6d9aeesm405515e9.7.2026.10.27.11.25.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 11:25:59 -0700 (PDT)
Message-ID: <c5a02b34-d171-4329-b8a1-ce7562752ee0@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 19:25:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] hw/nitro: mark 'nitro' machine as secure
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Richard Henderson <richard.henderson@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Chao Liu
 <chao.liu@processmission.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Amit Machhiwal <amachhiw@linux.ibm.com>,
 xen-devel@lists.xenproject.org, Sergio Lopez <slp@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Bibo Mao <maobibo@loongson.cn>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Xianglai Li <lixianglai@loongson.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-s390x@nongnu.org,
 kvm@vger.kernel.org, Alexander Graf <graf@amazon.com>,
 Song Gao <17746591750@163.com>, Eric Farman <farman@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>
References: <20261027181400.1752951-1-berrange@redhat.com>
 <20261027181400.1752951-9-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261027181400.1752951-9-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1GKya-Bb46zMZ_ikGCmA_NcmgOTeDwcZ
X-Authority-Analysis: v=2.4 cv=QvfLTlyd c=1 sm=1 tr=0 ts=6ae0ecb9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=ZVfvRXNSK-DTiSIkpbsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfX0hmzhd+waJ/F
 ObpE84qFOMfKvBYVHSuCbLtaA99U1gy37W2KZ3bjdL9gwmuX/lFC/k2elsU2xfwGRJ6kQ3AIs2i
 a9fPba3/F0H2Y1S0vMBfj/iUeaoWKmA=
X-Proofpoint-GUID: 1GKya-Bb46zMZ_ikGCmA_NcmgOTeDwcZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfX0oOfrb9gBmfe
 3ArFGr3Mmoihb41yVATyCqmhtLiamH5fsiZItxBaqq0MMFzma81Hz7OCu6evqRvC/QiypZjYhIN
 lIVklOpgDzbNNer0Sp194Z6CsU+shH+kcvH0NHPN7kt7PpzL4hgCjvwhoJ6nAY0+5wbwDCHBNXH
 jfU2uhom05UaKcMxt+EXCaM/zSpdANJdEQWKlve88AsvGOmiPFhz+KnW2tN7wYrRWGyxCXlrPRr
 V2yfm11zT730xfXqgGaCQfECLDttKTsQa26esD02JChSs2MI3tAfruqwbeO42wgSpiLjnFXXpOi
 CvO6OL+TQLBQhh/Kj98CAtUfAMnGZtDiYzraLAO+JGp94lmfnb2GIQJs3Erc3nWQsBIX62QBxTL
 EUtzA5f6sg+8hlH9SplOSSF5V4m7VT74DiNvXGpnOczhgujlQYUgAV6+L/K/TXTxPyujMFl10xW
 QrrIZTldU37sYNKVvbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270072
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, KHOP_DYNAMIC=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27/10/26 19:13, Daniel P. BerrangÃ© wrote:
> Unlike the 'nitro-enclave' machine which provides emulation, the
> 'nitro' machine is used with a real AWS deployment and thus is
> considered to be secure.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   hw/nitro/machine.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

