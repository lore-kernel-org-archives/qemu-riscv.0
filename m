Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6243FCDB46F
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 20:58:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbli0-0005qA-Cf; Mon, 22 Jun 2026 16:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wblhz-0005pl-4r
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 16:57:31 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wblhx-0008Lm-Fm
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 16:57:30 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65MJZjm23222591
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 20:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 l6sEmIGDxcjrioEYZQnPayUyo0QDkLrrQAM7DU9PKdk=; b=M81SE30bUlGz17yt
 vfO7e8IxUQgNWo/WZfFz/JlRgToFSzawnBXVFhuPSfArWenBtcSafBTySHfJoytB
 JI9AfK5mwxMPgtb2S8MouATSB53y2PuFV02qlQlcO4GTTPDsM7uOPhNYUIgDMrg9
 FyThrkPJImeC7DctInAgRg91vPnSFucbvQFo6MYrcnAXSbHbSYlKxrORXVcV1VTa
 hPUtdW4D++IGxlxZRZ4+UK5J6Dfiy+2q45V3dMCOVUEmpbQPq4NhEWKhjyMZ6byZ
 Ic/qcRS7KF88QgvqtCd0CintRJ4amAApkjf1jI/FHQumiFCA2Et+HCmXn4oSa2OF
 mnmbQg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5sn1ntx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 20:57:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-9254309dfd4so184532985a.2
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 13:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782161847; x=1782766647; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l6sEmIGDxcjrioEYZQnPayUyo0QDkLrrQAM7DU9PKdk=;
 b=kVtyDEvRpOxzaVSgxZ1P6pEObxRbTNGW2TMln6khKSojEKNg5D+4ENbQcCV7djFOxT
 d/KUg1PD0TxmoLpETOzSGeyPhUsi5+p8HZiicmtKxIjcq64DeyVK6FrQkb2I//MGEUHZ
 D5AM+rZww/4l8pUR1Wy0s6QQRIxCSp5CTqQpjAFXzhHV951XoCWsCjqs5ziqlpehXnHW
 WfWeavrREKKuAQ7XUszEzCLTCxudPJFJ64ePGbuvv+B1LDx6vX2y/sha0NKliBQOjola
 tD3BSa2OkHz2ikecNms3M/pta4r8TDAs61OtGSFTPqrZ+L+7BzsMbbwa1og8rr4AMjyr
 8WRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782161847; x=1782766647;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l6sEmIGDxcjrioEYZQnPayUyo0QDkLrrQAM7DU9PKdk=;
 b=jRS852PDIl1AlgIoJzOlufMTtauhKq3iYGRKXY44FsZHdAKP89CZrHe2xX9sauEeli
 9qCNg566+zInTwgmzFojnAlLg253QLYGn1MfwMNXSRrj1LFsc5/5xuoyhdf7xCNR55Ky
 TYvfJx0B8/Zmg9g5boHhvOWRNFfCYRJ5OURi+iua4XpoI0UZrca4cbrr5jB4fVP+x9P1
 q4dxJRUkiU31FJxIZN5w5ibs5EytS5+MLM+qXc2gfK5oweqj/O2zRIU6Xy0nlUAwU0u3
 nEz3SYea72qkLLzhuugTH7iYt+a0DbmwkHF7nnnL03LRG51P8WeT/SQlm6YIH8YKRlCA
 71jA==
X-Gm-Message-State: AOJu0YwOZ/hL0fSEDloc6wp5dh5lIzKqtyMfWiLgVHhF3THmGSFOWGlZ
 JjDO1ta4Qy2Noh2i106Uy9R0xaO7htUnFkHIGh2f2XZnJnLrpygOz16Vw7IAEsQH/78lrfZQhBB
 xlSoSq2rTno2PNK/OpHyiDhlO1t/pc1RWeFMmeI+rOR4hwrA+3jGs9mq4tg==
X-Gm-Gg: AfdE7clS5rbHaBDVWSNlWQnEwYtnYlTlDSz/pwX9vUjs3ara1Soc7HDq0sRHjbUb851
 R0fuSSShPyc2ZWmzTpd1mzaF7AAUkNh7VR3Lut/g0XTCIpU11LPFYADhay1ZjPwAiArjZrkFv1d
 8EPQUjs0DNHQ07vhArJK+YPxccTGkDaBfnnWAn2apwcqtd0gjFnXRAD+APS8/TCivvrnXC1HGqO
 B9gLZRmfmMpuxUF13sOmi+Dz5PTauywIP3DlpZpYTD7I6KRCoVva7WP+JOTg2KKkVnI1+k+UPTR
 ZldItk8F6c/0B2WhnzF5XbUlyVwg65Ry8F2ISTHNMI4GYARReV59lnDyrNZJSJuk4RCzex8fEq+
 PFWvCO/pSufl9rnMtQIW1QZKiuId0ofR6eXwmvjSw4q76uZXVTx5wy0DryL+oZA==
X-Received: by 2002:a05:620a:4116:b0:915:cf88:1e41 with SMTP id
 af79cd13be357-926482d491bmr19719885a.45.1782161846761; 
 Mon, 22 Jun 2026 13:57:26 -0700 (PDT)
X-Received: by 2002:a05:620a:4116:b0:915:cf88:1e41 with SMTP id
 af79cd13be357-926482d491bmr19714985a.45.1782161846320; 
 Mon, 22 Jun 2026 13:57:26 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49249238bfbsm253475405e9.5.2026.06.22.13.57.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 13:57:25 -0700 (PDT)
Message-ID: <a0e26bdf-80aa-48d4-bc3f-75dfd35094c1@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 22:57:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/24] target/riscv: remove csr.h from kvm-cpu.c
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 pierrick.bouvier@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
 <20260622193141.1449724-9-daniel.barboza@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260622193141.1449724-9-daniel.barboza@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: itx7K6LJHC6FFu5kDQP0PLtXYnBXceEA
X-Proofpoint-ORIG-GUID: itx7K6LJHC6FFu5kDQP0PLtXYnBXceEA
X-Authority-Analysis: v=2.4 cv=PuKjqQM3 c=1 sm=1 tr=0 ts=6a39a1b7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDIwMiBTYWx0ZWRfX73w8u7jg4gKP
 l25bqhMEcvzvHRYvHjLVZ+wNo8wsVhKxG/8yfA2Bs3XeoXX1MZfjMnKFIu4ShPomWBJeJiEoRsh
 /ZZFeaVDkvkDKu3RIY0pWYEZTOth4ZE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDIwMiBTYWx0ZWRfXyHtHiQ3CqZBM
 Av41fz6tmVK330p0+B1s/N4Bs1d9sR9in7b8GIchIBb6V5P2aTYhjRrVXTR2am3PWOg2F8+i62p
 WEychXn71rcZw0FJcnilvz7MM9CUSdtG284UFhKU3HPa7u3CsY6IQByM0/fgCHgwQ7KumZRCyFI
 wC06XcpLJZG0X1A6WEgB8ZFSb2V8KnYFnv7fkjVvjNz3xtSl3xns6OWQ7CTRMQDKImSD2nnYn3g
 v5GVBomwElAAAldOHh1dcL38d9RczKNkuuV0CWMz1J0sf9KlxTGw2yBcJBVJdc5hXAtTwgkOGR2
 sdjySwQV4wdsrWx7SKIcVaEwTXtYRW0taRXjlljQIIn9aeo7qDdhZakqJ6Z0ViNV5Y164/IEBDi
 ASzcZFPFa3Xicpcfybj5fGdxH1EcJvKFbHn1lR8VGtNPC36EQcGEU+coHS9hP3AEaQoaHltIXit
 8PKn/twF5IJmIiYB1YQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_04,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220202
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

On 22/6/26 21:31, Daniel Henrique Barboza wrote:
> Move riscv_new_csr_seed from csr.c to cpu.c since this function is
> shared with KVM.  With that we can remove the csr.h from kvm-cpu.c.
> 
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> ---
>   target/riscv/cpu.c         | 30 ++++++++++++++++++++++++++++++
>   target/riscv/cpu.h         |  3 ++-
>   target/riscv/csr.h         |  3 ---
>   target/riscv/kvm/kvm-cpu.c |  1 -
>   target/riscv/tcg/csr.c     | 29 -----------------------------
>   5 files changed, 32 insertions(+), 34 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

