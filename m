Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648B1CDB46F
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 20:58:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wblib-0006Hm-SC; Mon, 22 Jun 2026 16:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wblia-0006Fh-6f
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 16:58:08 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wbliY-0008QJ-Pk
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 16:58:07 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65MJZf4g178990
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 20:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Mz6UxXsol0LemdGfrTjUfryLYlzooWpVQoS1BlFInc4=; b=jGQYvVDyAddxkt7t
 2ZbnBHKdxslamt00Mm2gv18QTI1GcVZfI9xMYLpMDaC+1EGowjvjW4z85A3YkEnd
 ICi7V3JRWddUaYmE+TB1AtNJfl2Zl6zH/L83HJZ9GRRh8ZNwkLP4cDnyT+1rPvsR
 XPPrOHh+gAhjUW5F1bhpVub/+1mOaiwcHU+mQdUe/pxbRc6n4UKIzpOSCmDmko6Z
 LmlbwcVeR4Hy1Xc1cO5GOLbUKL3sSf1IxRHk2EU6LloIa4ROZ1EA/ydT+fBljw3Z
 9EOGplKbPk+R478UMqOelKPc65zRgvXpuL1QVeCcwkgFH2ELmuR8MsT7551poWNG
 lWzFBQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey2yhta5g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 20:58:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-9214bfa3b98so611908285a.0
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 13:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782161884; x=1782766684; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mz6UxXsol0LemdGfrTjUfryLYlzooWpVQoS1BlFInc4=;
 b=N7MPEWC3CBA3I6pLBB1Y/NFHUHWHtLCFN7rCjTA0W235Zw+CfwSDXP3YZ7mPJdVrPr
 qgL+XvV7AIBZJGayv7cIxKSpQnwz/u5AHP2VBMPfZT6hyMspcYemTwbjTiEdS9IAWBIA
 gGGcKmn27rECXDwTJX3Nbbs6HWzHEB8QiELyZXEts/RhtZAdY5u+QikFLcrtJ1AdwOIg
 jWUYOzsIzPLr69RKctjn9G1P5wvJoHOfWfg9oAaMIBVNR7OrMba9Lf8PXPOQDF94+2rI
 joOkY2u0C42uMIxrFP16AtVNCNIlTuSOggR4LS6ejXWtdu8uMLEpws3bEbG+Yx9ltf/K
 OstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782161884; x=1782766684;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Mz6UxXsol0LemdGfrTjUfryLYlzooWpVQoS1BlFInc4=;
 b=oE1GYWwbAxyFET3k2ozYvsE3veDfIchDLWgKYx/zUIHsKI6PFtwTMMZwNJLO/+EZ+5
 cvWv2bRrIAo9kL+aWJscb0uCcrswD4wmV5z8zSWK1SoiJeBFHCa+aP5hnBRBZqjMoDEZ
 gd4GBd4+4trmdKv82aHfU1WyIag4d4m/xZ+4gYDejOEHeTHGzVeG2ppO3bPIgedatc9k
 LJktiDK8j+xFE6ltnGXxbcDgZaSGzyZ1F0co+tn1Xwgyl5r7bZFcWhbCAD/FYspD7vn6
 4D0p51bhLnG7xGDlnN7nMFdArAOn47gfWkeLZVHa7tgv+YIE/RdFkcgrSE//bt9HDzOu
 I8cA==
X-Gm-Message-State: AOJu0YwSoA6JUjabAvsIdQyvHB9erFesKkhVACPYVvSc8v7a+sSOCvZU
 Y26e3Ue4wc/IDKSCvw22bD/Gv2+CiIme9RkS5+xEZVl7WhHynMs+o7IKHdvf6+YO84EmRZ5fFcZ
 GitaGYK+PkFnGXRcS7ZcOh01w787paNEfg0+gHh/IvtFIXmiYkwsIx5MZvjXI1s5OyniJ
X-Gm-Gg: AfdE7clErcO82i2opH3K5fpVhjex/5gH6o/lZ5187/Vg8+jqoKIyM9m8cWwJejVxpkW
 F6RadZ0wlror6ZBX9BjlN9+AERko8NabVi6BJtUENqOtzDZL+C8kCD36V47qrhUIPQDZXqo0RfE
 xUC/z9ww7FrST26Z6xFX6kXrbZf8tmN64uWOnYmHtZrn9DwuOktYfkfpmpGGu/4TndXUA3LqnMF
 D+TxcFXWXdUPbC2oNrS4sBDEg/SmBTqSS81HkRDxPl0pFVh4GuP3W3wIOfOwgDirczaalqAPEGQ
 LaU/F2JUWDZuglKTlCeFMEmvUfub9x6VAIWKFkExk/6cmI9CEsI0nQ52JOezHygs4a5NnL+jLQt
 IZAxIpXbHSnI/AOX0oxMYhWAEEn3Mrc6L8J3rOqNUG+PXzoflEViUUQrGUvtH3A==
X-Received: by 2002:a05:620a:27d4:b0:915:7f9e:a407 with SMTP id
 af79cd13be357-9208c044784mr2598129285a.0.1782161884376; 
 Mon, 22 Jun 2026 13:58:04 -0700 (PDT)
X-Received: by 2002:a05:620a:27d4:b0:915:7f9e:a407 with SMTP id
 af79cd13be357-9208c044784mr2598124585a.0.1782161883984; 
 Mon, 22 Jun 2026 13:58:03 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923ff8a712sm301423845e9.13.2026.06.22.13.58.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 13:58:03 -0700 (PDT)
Message-ID: <4228880a-08f9-4745-9617-2c228db03472@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 22:58:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/24] target/riscv: move csr.h to tcg subdir
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 pierrick.bouvier@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
 <20260622193141.1449724-10-daniel.barboza@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260622193141.1449724-10-daniel.barboza@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDIwMiBTYWx0ZWRfX3RXKj/cjT4Uo
 svLpkQxop656C2h7BeDfJjy1KkUuSwCxd7aVnr9R6EhnRHi2Cn74HgfvBCczYMZVJSwiHS5csYK
 2A7QPz4ZOswZtu0a/KTCO3Z1LV3Ov94=
X-Proofpoint-ORIG-GUID: 0Vugr3MoRdOI5kFRcBG2IIf9hsQmYZnr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDIwMiBTYWx0ZWRfX0VtoRnQoGuVE
 L5o+l5Vc9GKN73Afms5XnPa1VRC/T9sJtFrOW8rOyacfkr8UIhjeDu1ZgqpngHoH/AUfka/7FbB
 zFdtcvD3WkiKeoWMJGE5S9YfsMv4/gXPhf2eUw/ymgOWbbrzqqYRBEtrp9oWz7tajHK5fEfPi4d
 ItHYWaiuimuPggZkRC5t6YFNtyCp1GYBNDm3J2kcJtob0cpcENvt+SLgXYOkPOWg+ngg5uhLa+9
 hqGjj7MNuuAb9kxuF8AvW+daTvN7Hhxucb2mtvMvrJ1J3wGDz3DFphR8V3Kry6RZ77xUwunZv6h
 lVSj+ebfzcFe+1kEGN7QBmNTxRZokOldAPWA7o7mgnJlNXK0p0zLWU1B8mmnge8nWya1tSZtEac
 VVW4CkXM6FRIKHE8sCw200ulpPa2+hui4vsWC0CUo/KojDoFxXH7GUkNE/Dy3HUfh/LIwkA9Ckt
 3gQh5au/A4XayhZEXgA==
X-Proofpoint-GUID: 0Vugr3MoRdOI5kFRcBG2IIf9hsQmYZnr
X-Authority-Analysis: v=2.4 cv=cKbQdFeN c=1 sm=1 tr=0 ts=6a39a1dd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_04,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220202
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

On 22/6/26 21:31, Daniel Henrique Barboza wrote:
> After KVM is no longer reliant on csr.h move it to the TGC only land.
> 
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> ---
>   target/riscv/cpu.c            | 2 +-
>   target/riscv/gdbstub.c        | 2 +-
>   target/riscv/monitor.c        | 2 +-
>   target/riscv/riscv-qmp-cmds.c | 2 +-
>   target/riscv/tcg/csr.c        | 2 +-
>   target/riscv/{ => tcg}/csr.h  | 0
>   target/riscv/tcg/mips_csr.c   | 2 +-
>   target/riscv/tcg/op_helper.c  | 2 +-
>   target/riscv/tcg/pmp.c        | 2 +-
>   target/riscv/tcg/th_csr.c     | 2 +-
>   10 files changed, 9 insertions(+), 9 deletions(-)
>   rename target/riscv/{ => tcg}/csr.h (100%)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

