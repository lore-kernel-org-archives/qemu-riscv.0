Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E312CA5FD2
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 22:13:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCP1z-0004S0-68; Thu, 01 Oct 2026 18:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCP1o-0004GN-31
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 18:13:26 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCP1m-0003I2-K6
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 18:13:23 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 691FsRmN2267821
 for <qemu-riscv@nongnu.org>; Thu, 1 Oct 2026 22:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9kNL9DZ3LulD2blvbhnO6pWORCE7R+aZaUtTI6NaXGE=; b=PdURYj413Xb9MsvY
 owByaWS9kVlRDzUFa5EpGybl1zvBZl/YsHa0qecMgNDeF/xTrFFSzaYpX4zJyNTq
 jcrj+QvMEZtrQu1ODisk/3jbgcJe5x932ZRKyijbnraqjmtbvhWe8XN00rQwPVt8
 zRwLF2d0KU1gxIipHKcRT0MrcwPEJV3DFFrh0bOD8B41rPMyNxHG5vZrRYj4pN4f
 o+RjCkwVOpJFGYCXBw8XcSSXE2w4dyU5q/FqtNc0WCVBqDwaJjb4mC+Aq8TTMyD7
 HtrRI4xJQYGv6fDPBsf6OYX+JPj/6BZ3YEMa4H7NF84nycRuoq/d073aFbZ9zAlq
 IL0Faw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1rvqa4yx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 22:13:21 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-30f1b904861so9138569eec.0
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 15:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790892800; x=1791497600; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=9kNL9DZ3LulD2blvbhnO6pWORCE7R+aZaUtTI6NaXGE=;
 b=apqssZNatzOia4ZLbMYoB6aixMdR1IWPVAlkHudf6XnIDZNmNObq44YPlDmvrGiYB9
 t5mXVJYRv5OdacvD2jG9E6qMMn/sISNoOI5qIrzt9R478Z39+mEsqaKOAFnRw/MGIRii
 rMmozOdR/RjwVNLo4CkPX23oQS4hDKqhSFxkfw8oOM+yNWogxTckOtU/jZUs9NhX5ZLG
 gGCcnOBmKL0QXZPKuOsmSsaynx+DO7SPqNnBz3ZTaVpG5PRMHLMHrBKrVrH5lUK07NOD
 QtFcKCEjT6/7urt7zGgYfWAbznYjZD6YoyyJT1oULkfX2onA81Z3inGtHJWAvOOXqX4E
 bi2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790892800; x=1791497600;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9kNL9DZ3LulD2blvbhnO6pWORCE7R+aZaUtTI6NaXGE=;
 b=RuTZvFqaSx4+Sg92B8yd7Lnzo6YBUpKs49wRKJgviE/GF7gDFyzb8p/KFERML/XSm/
 QXVb9foI1G2Y8H5MLe1iLjOFXZs+KwwMGUCppyzy5zsk35e15fQKtP//fsnIVncCRy5P
 wVersfbU29rVWegxCOfy6HrV6H0VwdyxgVTnfGOFb8FNWp91z7SRyw6VhoDuawYSNMo8
 JwwLI6afjVJSsLrJxOxylxCbnIFYjIq9cCqLgNql13/Wu3shA1sCFWXpbOLAYUn4SGwh
 hgdmfh2vDLkitVj0FHEAqRAyyA2lNNEJCOv9LvGq/9hgfAs9wajHp+SCYVDedOC/FJIf
 5oYQ==
X-Gm-Message-State: AFq9FYKOe67c/xTUPWnQ+Ucvy3IECIyC+Or1gQ+SAwccqjChQ8+s13/0
 dXDj6bkHUW2BtVm7x8YFQTyNd7pPGpEAwy9Q9Xt4iASGZv17ojPdco3wKZ63cR5FkpuiclJUgdF
 Ewh5DW4DgWe4aRMBOcW/EY5ig/MCsm93gmCbx2LrnhcELrKmkUsf0+IMjYJBkRNc0Vw==
X-Gm-Gg: AYBFou2JadnMikJlMEkkQI3Y5CGfKZXvJYGL85pbxQRhUtZEapw1PeLJAQnJue4XDCm
 4iiacwZIScnM2BOx2DqlH9QG05xg/TR9JFPcjUMSNYKsBpTvAmoipLoAve/fbWhe4ajRgQRexuU
 VHRBKeDxdIestcwdParzWRw7DRKB/yIVnajeGFmoCrakdtktQSL1CdjAp0mv8ZG7SvZLHJpqVZ1
 qy/EB09j3tItos2i/CsBouEXdINO30zSZc8f0xMLZCcOywbubDZSsdfLaxo8cV1ozjcAEs8diHG
 QbwqQdZOBDXkaeO6lOYfOe6ePzfyuVpLOIAhXhAqgPSjtsV3V9UvZLlDK9dVDMFyOC2ka3YajHK
 BUtadvZ2lItQucew1YAq47nS9DSQkFLXGyGgyq2q+vkpBZajJbpIExO+iL6YDECGdS9GqxQ==
X-Received: by 2002:a05:7300:b905:b0:343:6622:ee15 with SMTP id
 5a478bee46e88-34f150a014bmr1026471eec.11.1790892800282; 
 Thu, 01 Oct 2026 15:13:20 -0700 (PDT)
X-Received: by 2002:a05:7300:b905:b0:343:6622:ee15 with SMTP id
 5a478bee46e88-34f150a014bmr1026427eec.11.1790892799566; 
 Thu, 01 Oct 2026 15:13:19 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-34f14f98527sm1008570eec.16.2026.10.01.15.13.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 15:13:18 -0700 (PDT)
Message-ID: <e6190d35-044c-4c15-9d50-da6c18428226@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 15:13:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/18] target/riscv: Compile time_helper.c once
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 philmd@oss.qualcomm.com, palmer@dabbelt.com, alistair.francis@wdc.com
References: <20261001-rv-dedup-v1-0-ea69b07afd31@rev.ng>
 <20261001-rv-dedup-v1-17-ea69b07afd31@rev.ng>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261001-rv-dedup-v1-17-ea69b07afd31@rev.ng>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA4OCBTYWx0ZWRfX8pgRgf+OJYd9
 w7zAcFAbdN9PfzVu8QhG9r/kbljKr+wKxTVKsZ4LgcJg9eLntnfhdcMbTre7/cOB2Tw6Fs4txVD
 nZmwRx6umCGd+x/aBCTr4jYDZJVF9HKrR92cykH14wy1pDQIi1+pcDFnH8JqXQ1nffFNzvltSb8
 gN5sHkz470YhoB4svOFUsFq/FekdcYpEri8zev+uK3lI5afm4AWXsWd3jLAd4xc+nueEfnuYfKu
 lyOeLkfnldO63hkizaG2hEsnlTm9h/itlPMTqZ13B5cJcrNxmoL01qJ6BkVvoSt6KHQ8UIfjFDX
 gUJk7j+7olRYWg53ilwKd8uccs13wexyNtpEEoffsHIdAF163QQmwtSVquGc1Oek0ks7UpTQBd0
 eF5PhpQQbcBifs8PwAFtigYe2aJtSpbe6ZTKBr+w1/lmGqXsPP7yZrptAcB+g3nBRM5hRlgJc61
 mgnVYbwmCzS1eopzx3Q==
X-Authority-Analysis: v=2.4 cv=JIauIMKb c=1 sm=1 tr=0 ts=6abedb01 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=nFgamq1sSFmvarFgJzkA:9 a=QEXdDO2ut3YA:10 a=VxAk22fqlfwA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: DCIrFOBw-f_HU0l89QcKCPIXAguSePg3
X-Proofpoint-ORIG-GUID: DCIrFOBw-f_HU0l89QcKCPIXAguSePg3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA4OCBTYWx0ZWRfX+f3fEDGaoH7m
 b3BQ0wTGRnJu7XhH4ZWeaYqoy5sC7CnSntmMFIkGtgZHAFrDW9p6dppOGuOXCEtw7XUA+7HnD6q
 R3/NoUXgtidHNsgp0DO0+kLGQUPP660=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010088
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

On 10/1/2026 8:59 AM, Anton Johansson via qemu development wrote:
> File is already agnostic to target specifics at this point.
> 
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>  target/riscv/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

