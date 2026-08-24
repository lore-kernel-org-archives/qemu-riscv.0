Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58398C5DF9B
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 12:06:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyTRQ-0001fL-2p; Mon, 24 Aug 2026 08:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wyTRN-0001ez-JR
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 08:06:13 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wyTRL-0003hx-Sm
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 08:06:13 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67OBMhWx2846128
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 12:06:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=n0cClIHixHUlZXhMctR+9b
 diWn/73kU4mgadv/yEz0k=; b=bQwgtnwnhoAXQrU9POkHckllDqK0jTKe6rJA4F
 DCnD5pV/jZDGEA+79vroDkVXtQOEjh5lzs3CX6Nf36n6cB95DzaNNlsaCjyRFp0N
 jwzBc4RTty01cWYXO0GoyoiyXOwXGkHdo9iwu0+lqyGJ1Ys0P/hkfvkiVn1MfZe4
 rb+gul83Bzx7JF9MbfeyDc8NoZ26GfrNBtk4KCO7oR4blIs9b1G90JRgdSptSoaU
 2etZK7BgPQ7UFdcF+2Dd+IUWIQRZ2Du6gmPbUg3KseikJGEcVijkBH083fJfxBfZ
 zTxpgWkwQgXRU6TggqBbQcQfD9uH670t3ygukyLbsnbxw+8w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88k7jjy1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 12:06:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92ec3146553so629401485a.1
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 05:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787573168; x=1788177968; darn=nongnu.org;
 h=content-transfer-encoding:content-type:subject:to:content-language
 :from:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=n0cClIHixHUlZXhMctR+9bdiWn/73kU4mgadv/yEz0k=;
 b=dqqWA8GBV47DZZ/rJwmxcQ+bq0jHUkGUf11kmx/wgLgI6vxI+vkDQvt6jDlOB9s4XS
 ia+sYKE2okyFzCAP+wlv1Xm+dfZUj90TyU09z/j6gBmJyk9sbOEV9hC9jntEJL+XQ5Uj
 RsT8y0QdD9qkiPIVlA/mujWSr5cozX/IzKRmu3Dd1SMbSfdSztG/qw/VMomTE83boXlQ
 td61NgFYHtCYAdCPYtFeO7navzDdZEQzNTuQ/UDqIE1oGot86jnqPw4Qz3sTYbcCDGUm
 dXqXpYcqWW71gke4v4cHFmI69lY107hJ6l87QyAzP9y4ge78JnTZF1Ly7sxD5RSzdAef
 Lthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787573168; x=1788177968;
 h=content-transfer-encoding:content-type:subject:to:content-language
 :from:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=n0cClIHixHUlZXhMctR+9bdiWn/73kU4mgadv/yEz0k=;
 b=qN5axTaYj9JDBcbBHzpKtVjmskaWOHIqsl0tScjlo2uucvKJDxhS3FDVKYzg+sHMWy
 hsPuA/QDzYTh8yMNlzu8O5a1NwXxBaZoF32dbCn3fzlx0z23B6TkPr7gPReqs8wPyNnM
 AfHr7Y4drTvNa13lJhSUIMRlUQFtMpIss3AGvAJBtfeh7b+iLj1AkJMJKzBC4TrdqL1u
 5hLWB2I2wlLneMxAgosafPDtt7wnVJUWjxrU/jqIO1RJG5GdmEd7MCY4rOlSYBGvQ9gd
 3FZPT+A3zbcLjtykU5exILeMNyliz0+vE5b3182BWEVr4+9wwFR1mkXDQ116acZzJmI+
 EuPA==
X-Gm-Message-State: AFuF++n0R8lRB0R7q6Ix7GT3NckJltLwA//4zichsyaRMz6EEsxJIc9U
 r3wJQFvfrEAT7ks2wfbZLdpNFmpVWRqTZeoo30nsO7gjEacPy5WreiYMy2gLxcHYaSdPveUTaI5
 srTIviDEpOhskDAT9iSlPi4gsHQH4B6NEaPz+umCV4/C/x9iY+3sM56FCROK3kHWQCg==
X-Gm-Gg: AR+sD10IRn19HiD1RRVGOHqytPBYsJLx7C1/2/Tp/pphlEX2E/JmLrJSlz5RLcMRMlj
 v6wNBh/gKuF78stzE6GqPa1ISa7K1E2fc7rKRrjcMS5kS/AEo/MFan/1IwwgEEe0MO5F/uMjnEp
 iE4WV3h74zcmEqwEi8otF6y9bSbsET5WnYXEtV1YNtoy1ud81jfUhe6T3OkC9qcmgjVuFNpQqdj
 nTcEHwp3DNVBPNwIkExyCvvC/7iqHkLk17ouzYYgn7ut1DR8QcaHrSeQqju4UUfR1sUicMuIRqF
 RH6hrBbx3dMNT15HHQ16rKwzy//Kh5hNdcSCww/uxDQJv1yxCKmK640d1jlOvJ2XuIL/CVIbZ1u
 u0ormsgB5g4MmoChTirbBOyNPsFwudyjFDD7G
X-Received: by 2002:a05:620a:7102:b0:932:fcb4:4d0b with SMTP id
 af79cd13be357-9374694ceebmr1535358885a.24.1787573168583; 
 Mon, 24 Aug 2026 05:06:08 -0700 (PDT)
X-Received: by 2002:a05:620a:7102:b0:932:fcb4:4d0b with SMTP id
 af79cd13be357-9374694ceebmr1535350385a.24.1787573168064; 
 Mon, 24 Aug 2026 05:06:08 -0700 (PDT)
Received: from [192.168.68.100] ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93749ea4cb8sm480015485a.41.2026.08.24.05.06.07
 for <qemu-riscv@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2026 05:06:07 -0700 (PDT)
Message-ID: <49b219d0-4f78-42e0-af80-1ca553fa1a6b@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 09:06:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
To: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Subject: Please update Gitlab issues you're working with
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b4iCJNGx c=1 sm=1 tr=0 ts=6a8c33b1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=p0WdMEafAAAA:8 a=B3RG586bStIUM4VFjGoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEwMSBTYWx0ZWRfX2K8P7i5j9fzA
 E/c/7/K9z85k4r/HpNsnmmc1tRIFqcII93PBs+2Kh3aluIYdCSOf/1JHo/LUccE0x7mjEq+mqgJ
 hCJDYGYIflSKmehp1duFmkq80Ai7UVs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEwMSBTYWx0ZWRfXzdoCcuwbfSZN
 uQP8XwkHAulnlaTCnikdzaaxg1QqmBSB0IST6hpKSwVjvEH4bSE0EnDTQ6lAy6Q7O+wmp6dK9an
 G0jhloVjlxHDM1N0yQVw3WoidReu8KjJT7/0ib0ELTyah45NLkzPnpyrMRhaSi+AW5GWdS4SWro
 I+ZA8jgbSO+O9uZZUuGkkGaQgQxoKcrtbqenRfZEtBkohqI3si4tb1hZS2j/BFn/9cRMhivQow/
 yZ7K2eXIuDhUnVd/2mW2Dhk+veI21nWrWmKnry/5Hi7i2bkvMxhfSYOZgB6gcOs5zToY0SPozPw
 Gf3UTmZZjWaeIQ/EN2WtuoS0kSpd+Z2vNyoMNc/ku3EN3gkH/53v77babZ7ALs3HnBbDoKsMBD+
 fNxIUzm7FoKYhBcN8Scr0d8MxFwwOcfULjvbpwiq8ZRFcvnBUvmii4sWZ1Fsxo1MpNOWmMuLoj1
 tsTNAMMlIgB81eJZqdA==
X-Proofpoint-ORIG-GUID: UddgF6uzn2pdQilXxGyoRUmhxYbRV0Lq
X-Proofpoint-GUID: UddgF6uzn2pdQilXxGyoRUmhxYbRV0Lq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240101
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

Greetings,


We have at least one instance where two developers sent patches to fix the
same Gitlab issue:

https://gitlab.com/qemu-project/qemu/-/work_items/4108


Please update the Gitlab entry when you send a patch to the ML.  A brief
"Patch sent to ML" suffices.  Let's not waste precious developer time with
duplicated efforts.


Take care,

Daniel

