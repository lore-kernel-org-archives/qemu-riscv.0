Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E23CD5BD5
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 May 2026 19:38:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSgYh-0002p1-0L; Thu, 28 May 2026 15:38:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wSgYe-0002od-Qr
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 15:38:20 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wSgYd-0005KM-3w
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 15:38:20 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64SHEKAL1469251
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 19:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TsT2beYYQqdPa71adxanh8NmhSsvLPvCYFxHzZnGr+o=; b=XILzsh0IF8YiFZBZ
 icJMuVzpR+uEsHVhuEpGAAmtDOnHS6TVREMpcumOT7RZ2ZMUkSxFUUf40cV4Z70j
 Ga1625/3divTd4Yki3QcCG9nVqndhoFAvPOc9N3grfMSimVrFCEb8mnTh2S58HNj
 7FWNrmxkayCZSpNr2rEkQdNXh3t0HyGY7R/18nnqtM/kTVm5pbvf1orTOfUBMHYC
 yq8no0zYez4TvLmIeyAWx1jvjOq8JnL8vENlymUfmBqiXNWky2Vr3vvWTvpRenw7
 sEaPNSongGUslCjBEZTYNfilXHKjV7Xri6F4jM0mzFODwYgVnAxpqKC58ec/lNcb
 c5xd3w==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eesxa8n7r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 19:38:17 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-135f2aa4742so3516233c88.1
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 12:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779997097; x=1780601897; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TsT2beYYQqdPa71adxanh8NmhSsvLPvCYFxHzZnGr+o=;
 b=Y6lrzwvE0lriv1ElVGoXRFSVXS7j31J8W0rQon1m+gLr+j9EphkUlS2XU3IMIJuclo
 e1HxtAjMF6vgVwxTThtB+LFR1vKhEU2fzR/DD8ma4HYIRk3QcCZn489O54C5pob4cRh4
 7rLPquhDIXyBN/zDW4NeuPS9Iy0eXG0sargNX/SwTG/pr6JjU55vasPMTlXF/VtMmUnI
 ZqSV2mO2kvd3qQgEWNFtCnZb2RjBrbyf4BBbHAlL5nJLITEDI42EzynK4iL1fLSzbGay
 OYt2o2X2ZH6/RfL6N2pNBTea7ioU7vMMgV+SnTvnjzMUDw7qFTm4r/MnztF+O3yZeR+U
 2btA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779997097; x=1780601897;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TsT2beYYQqdPa71adxanh8NmhSsvLPvCYFxHzZnGr+o=;
 b=SjOuPH1QtJ2GXBPGlDPJE05pCjWMQk5E9ZZQpK+4Rwq22IR1fAlVzBvgicRm8aUGL/
 Q1thZ7x1I2mPkkPZYoSaszG/4ULdSKibygJHNBo2my6azGX+ONbO9U4+H/yBlaA+RLWI
 ofbYm49OH3DhVL65ihufbBylJMgXgFA8JDNn39zFuSBTSBiNELKHOFd4f0dnqJDK72lR
 S2rDjrIE0IfE9di6266tNXWJK397IRZ0kL/U5LsV3/zJaau/V5N3P6Hy+0DwzMbJpqPX
 pAxQudncyyrfFFEkBQqT2/ADw24N4FS4ZYHLnHW5a+oCebN8kqUcbgw8MibtvUfop3Oj
 iUMA==
X-Gm-Message-State: AOJu0YzSedGXL3878fxm4+9XJh3NK7wR7SS/BjSiTsua6K33C1uwiS9N
 KPuc2TX2ibLusRhklEh1c5Vlx2HExA31+dgmB/RKZWo0hK8suBu4FzSQGEA9bmEzHN7ByOPVE18
 87o8G2yuD0fazUygcpp5lmQ2rQq9446S+fygR5kfC59rLkmoFSHm15XDpvw==
X-Gm-Gg: Acq92OFDyhzM3vrM1TuolW+o4RCwa1ynGWnIONmDIGQgALLmrbjGU0btia+kXxdKysY
 ekk/J+DoOrx2Lm3vkjY1nH/GVBZLVu9ZlAoVCj6s6yTc9auG7KoOiUhA+hCXq/+cyEJvKfwOXPx
 QNWqWe3zdmMm+6JY/pUduhvZMtmae8yAbPvm13b38ByCXYZEwEY5sWi1rQAfxOs8wJkJOx2zqLR
 nnm5MxCwDvmaAB8+RVtvIUqTiMb3zehfXpikOrq0AYRjAumpI00yl+S/CMf5AE5XUCW45Xy5D8H
 v2NAyFtNStYF0vG4kvbT30PxIo+zmr6NmGQfdvFN2jUFmJC08+NQAToayAZgTfsWHda422d3gGV
 L5FUOLAez97NTz1tTQHmh0R/B9j6DAEU+J0oIgJjm+1TU678L0bQf6qD2/q5cEb5O9HV3xYj0cr
 xd7Bop8tOigUCuCqloEdxdVQpW
X-Received: by 2002:a05:7022:2529:b0:132:956b:3a3 with SMTP id
 a92af1059eb24-137a82533a7mr184939c88.10.1779997096735; 
 Thu, 28 May 2026 12:38:16 -0700 (PDT)
X-Received: by 2002:a05:7022:2529:b0:132:956b:3a3 with SMTP id
 a92af1059eb24-137a82533a7mr184925c88.10.1779997096204; 
 Thu, 28 May 2026 12:38:16 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137a9ad6ebbsm110469c88.15.2026.05.28.12.38.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 12:38:15 -0700 (PDT)
Message-ID: <d394c93d-86af-412a-ab42-274ee7567d7f@oss.qualcomm.com>
Date: Thu, 28 May 2026 12:38:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 07/12] hw/riscv/boot: Rewrite setup_rom_reset_vec()
 using load/store API
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 Anton Johansson <anjo@rev.ng>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>
References: <20260527201348.29511-1-philmd@linaro.org>
 <20260527201348.29511-8-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260527201348.29511-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tRCXhILjz1K0nqighLuz63xludNZMVXd
X-Proofpoint-ORIG-GUID: tRCXhILjz1K0nqighLuz63xludNZMVXd
X-Authority-Analysis: v=2.4 cv=ZdIt8MVA c=1 sm=1 tr=0 ts=6a1899a9 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=X6yYlNyqGR7QDSpYCfcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE5OCBTYWx0ZWRfX+kjAtPMWiXlv
 GGZwJ883/bOvPzRqLQy2D5g4p8g7bGu+mL52RLJRSVoqtgp9NlftQJMSohvWJfHkn+lzr1Wpwgc
 dV/W//ZvP0kEtqO9zrU//QgzSJ1mLtna4fsDcHpUME5oNER2hWUyJcT+M/iEkYvM4SffAYO46k/
 z23yuHWjqh1nph8gA+ko7bb/4C9pb5JbJUR3e6Dh+MVcJDeoHTSM8uKPR6cJKrkqbVA1w5I6Agq
 4/Dzm+PB03TaCiGeVXDpB77TzzbzLgz9hwo/KaxvSwwzYE/r3X7HCOBLz6gULjdlGFOkkMdmH90
 uaHAWrVpd9D4U8BD8lQajTFb4bhvjhWHDdRxdPhn9lVx5feJZ5YAh43FQ6bIMFXYkTNebd5kf+O
 B4iziaRRU7jGr3Nemak4gt6OjwbZlT6L0WxBggvbbvDPeGdgOfRkGHvjCy3P4FTQv0EAnVaKvX9
 IaAVSp44vZvNb4ybbyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280198
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 5/27/2026 1:13 PM, Philippe Mathieu-Daudé wrote:
> In order to make the following commits easier to review, do
> not pre-initialize the reset_vec[] array, fill each word one
> by one. Set the start and FDT load addresses using the load/
> store APIs.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/riscv/boot.c | 53 ++++++++++++++++++++++---------------------------
>  1 file changed, 24 insertions(+), 29 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

