Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A79606A31E
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 18:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z7U7OoqI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cILJPTJa
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLm5H-0005CH-DV; Tue, 27 Oct 2026 14:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xLm5B-00054F-Pu
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 14:39:41 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xLm58-00067f-LH
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 14:39:36 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69RIHbRS1917511
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 18:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0fFp2XR6tqTAtjOPVNZuCVGp8gPciPiskpYNUPG9kPQ=; b=Z7U7OoqIscHXY6xZ
 8ZWj8tP8GfxRbaeMHBk7lzFtgCXBm+gSzdq4g2rWFv7wZuIRYbbGji8Bo0NZ0XIb
 MBslfZX2LMUBRrKXgL3Gg2vq3FyYs6AtjjoWIDtHQUMBSEMpDIBx+G09CaHxKakn
 u5OKYu0RFbNSZOeuuXBZgMVYiPtgijNpQzWO+535Ex8wTsiOVc3qN+udXOwN6I9g
 ha3J6MUgU0o9D3vfo1hACP9v36uQW93PtV61OA1fI9RZz5OHDMAKVDWZtoBMFFxR
 HUUnJWOmkH4b5NsNpazkV1v3GmsPm1GklCXJv1a7jk9zdkO4eNP+O/0hrVvEpeTJ
 gs5m0Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjux99pbb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 18:39:33 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-35c3c370b17so205907eec.0
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 11:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793126372; x=1793731172; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=0fFp2XR6tqTAtjOPVNZuCVGp8gPciPiskpYNUPG9kPQ=;
 b=cILJPTJaJ+wRf3HCcxOUuCZniYCtCUFwsukOt4jP89zQ5zZ5IEijq+aJhuFNgYE+Sp
 eu8GNKWIMeCXX7TJGWpxnTwiFxImbvVb67ef47/zUF7mMYPv9GnRdRlsFDctrYjMxT/g
 DsfLWgEp65BASQsw3G8yqDdBrw5Otdx2doQ9RG0mPjOsBP6u4ozHz4aAn95gcKuRxkqJ
 N29b+5SUfYVoCU7DqPJAt4uYkJCgcrQE6G1tNokvfVAdeF2E8/QXY4utm4ZKu91njtHS
 nqVg275zZ8WBH2hhjPMgAbkmuDG58aS/wIodAEYyfdvqQZUl1fHj1MYy1wRkTdEqaQt9
 GOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793126372; x=1793731172;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0fFp2XR6tqTAtjOPVNZuCVGp8gPciPiskpYNUPG9kPQ=;
 b=LioCcWBCH3fSmecNEz6IJomE3ww5/rpIExbEtTdLF+inqlj0Jlk/78/RHtwY4jrHA7
 RvYqyquZnKTwzv74Ca4HZ0jCkuJXRDrrifp+0RC1sYeTgkBhaCvaCnoWkaHP9JYlDIq2
 ZIfVqbNoaAmlTmDJoXhRw0ZJ/Uge+v3vJHUFWoXpNzmClRDH2ZWSBY3lZD4BcfkieUGV
 Ay6v8Z0t/6RUWlJsNhhrt/azflhPInyCXWTwSKx+aX9lUpzUBVJbdwf0D+PfTiQXuS4u
 +onNp6kmmhxcSANffkXemj5VfNPMctYX1jlNnr9IoErR3y5VkDSiH84MFpyYuFzgOFKw
 3oFA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzdeoUrhPsUU2QmCu4tg59vraDpHu9x7GLok/5yK846mZWoYrwXFJJ7leDyfIEqhxJ+z0+qVRR+1v0N@nongnu.org
X-Gm-Message-State: AFq9FYKGSsdMdcuuTbcaN7yby+JSXW8krvaiqaLBa8IEat+Nit+nIrnl
 b0kvyR0rlDj3YwCBES1QgINpsn9h4yEQCin8eGgR/QCJL1xT1TzNVdhSiRFyfNfXON48MPr2oIO
 I1aneMBQqLFy418oMPSme9DRwP0w3kuH8IMm7JbmVC2fjDlh39wwzkRXnoA==
X-Gm-Gg: AYBFou38qvFc0fJa1l8ZuNOlM+IwjyfSid0N+CfZTj2dgnPRDrdumvB0JXKwrd24z0g
 2ZwvHV7BaaRLKDFcXMmbz3KzzKKdqfah9k5vbBd1z89ApiHaDrWC+v6WX490k7w67fLs1nSUnlO
 bm+duOAw9XimxTLRhxf7yuNVAAlGFjcEc/CX0nVJr54VgFvCGY1ikjfm/PAQB55G9R98jT9dPlN
 oHPAnMBD58/jWeGau2SO5smdzVIlkLyodyZjum1WG4rdfLXuDgPLiC6+LkEMkEU5z2GHGYNA80O
 gqS/TZAToOnMxi0Le1r2BprPauoLGy11Po7Vdc9RjITb7u6zM9BoZeAu7oco/cf+xZaRGtlNp/a
 YASRiQk2UDYoz8oaE061Qj2c3kAiAoWwSlGb8cvQu1bJe9DhaknibwagRmftvVQ4zq/ZCfA==
X-Received: by 2002:a05:693c:42d3:b0:361:6884:78b1 with SMTP id
 5a478bee46e88-36a2043f58amr306561eec.28.1793126372219; 
 Tue, 27 Oct 2026 11:39:32 -0700 (PDT)
X-Received: by 2002:a05:693c:42d3:b0:361:6884:78b1 with SMTP id
 5a478bee46e88-36a2043f58amr306498eec.28.1793126371461; 
 Tue, 27 Oct 2026 11:39:31 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-369f4164886sm29583339eec.7.2026.10.27.11.39.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 11:39:30 -0700 (PDT)
Message-ID: <d754acaa-0811-4185-a78f-1a352ec8bbab@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 10:39:28 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/17] machine: uniquify virt QOM names
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Song Gao <17746591750@163.com>,
 Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, Philippe Mathieu-Daude <philmd@mailo.com>,
 Chao Liu <chao.liu@processmission.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Eric Blake <eblake@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Max Filippov <jcmvbkbc@gmail.com>
References: <20261027111216.392-1-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261027111216.392-1-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GYyCDgXL c=1 sm=1 tr=0 ts=6ae0efe5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=iL-VRDW1RFForxySS0sA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: Ge2s4c2hUFWxgwHqrAXqtpvtkoBSiMy3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3NCBTYWx0ZWRfXyz0rC4EZVxwJ
 iI6KD8VLxG0/mp+efWhe9PPuZ8S74qOf6N840iJ5uxm88FmF7t6FdH4LvltemdMIe1nZhwYzGb6
 YALLG0kFB8CDQWj9NCmKVveQObq/vwDX61QjYVUGJoilPrLSEWQODwhkCnVy4mYFqpSW9QEeWXh
 kSO4nBPqGe5dpeB8RghxQpe/NFBAXZkI5SMNa7qMg1bo6bg3F4X+iUTQl/eTUm/xF73FOrFvdXM
 ClkHtI80yB0v+Ml4VGSciHUj2+72JSZuP7rBaWCO7/5QoisdE8bGDqGtj55ZjlESLQ7mIcahBkX
 jRBIGZwtcjafdjbXwXFHojOijtFhniUoSR57lHJn9JZy574/Z/fw2KUAJWKneFFqWjEW4lejAss
 INkcUnHOfoBhUNYVJBdXrYVe9GYsADYxwryPenSW5TdtVqvzBZejIZ8QpmL/Wb8cqkPvYOHQmdW
 kTx43bAPIk1KeL/bgPw==
X-Proofpoint-GUID: Ge2s4c2hUFWxgwHqrAXqtpvtkoBSiMy3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3NCBTYWx0ZWRfX2Tz6p7fEI5p+
 dwfIsUMIzFxA6DiDT7JsMI02sabxxpyW3GBAyItUX3NDLPML9eKsxiS7GzuRq3eqeoPywgfqQCj
 n6JuftphflHoIBQGz5/DIO2xPmYvGtQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270074
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/27/2026 3:11 AM, Yonggang Luo wrote:
> Multiple targets register a virt board as MACHINE_TYPE_NAME("virt").
> Those QOM types collide if more than one board is linked into one
> qemu-system process. This series splits the QOM type from the -M name
> so each virt board can keep a unique type while -M virt, help, and
> migration stay the same.
> 
> - Add machine_class_set_name() so boards can set MachineClass::name
>   when it must differ from the QOM type. machine_class_base_init still
>   defaults the name to the QOM type without -machine. Document that
>   MachineClass::name is the -M name, not the QOM type. Sort -M help
>   by that name so order matches the printed names after types are
>   prefixed (arm-virt-11.1-machine vs virt-11.1).
> - When target_heterogeneous() is true, give each colliding virt board
>   a unique QOM type and keep the existing -M name via
>   machine_class_set_name(): riscv-virt, arm-virt, or1k-virt,
>   hexagon-virt, loongarch-virt, m68k-virt, and xtensa-virt. Otherwise
>   keep virt. Versioned ARM, LoongArch, and M68K boards keep virt-<ver>. Latest
>   ARM virt still sets mc->alias to virt.
>   This is for the review from Daniel:
>   Link: https://lore.kernel.org/qemu-devel/ar_dK-_KUS3h2dkL@redhat.com/
> - query-machines returns MachineInfo typename, the QOM type from
>   object_class_get_name(), for qom-list-properties. The -M name alone
>   is not that type once virt boards are prefixed.
> - Use target_heterogeneous() from the base. It still returns false, so
>   qemu-system-<target> keeps the QOM type virt.
> 
> Changes v3 -> v4:
> Rebased onto d73149283205645625bfa9fe029cfb68e4c4a9ae, which already
> includes target-info: add target_heterogeneous. The boards.h example
> uses arm-virt only when that returns true.
> 
> Changes v2 -> v3:
> The versioned-machine example in boards.h now follows hw/arm/virt.c.
> machine_class_set_name() keeps the -M name as virt-<version>, the QOM type in
> the example is arm-virt, and the latest helper is DEFINE_VIRT_MACHINE_AS_LATEST.
> 
> Changes v1 -> v2:
> - query-machines returns MachineInfo typename. v1 returned only the
>   -M name, so a client that appended "-machine" looked up the wrong
>   type for a prefixed board such as arm-virt-11.1-machine versus
>   -M virt-11.1.
> 
> Yonggang Luo (17):
>   hw/riscv/virt: move virt TypeInfo into its type_init
>   hw/arm/virt: move virt TypeInfo into its type_init
>   hw/or1k/virt: move virt TypeInfo into its type_init
>   hw/hexagon/virt: move virt TypeInfo into its type_init
>   hw/loongarch/virt: move virt TypeInfo into its type_init
>   hw/m68k/virt: move virt TypeInfo into its type_init
>   hw/xtensa/virt: move virt TypeInfo into its type_init
>   machine: allow -M name to differ from QOM type
>   hw/riscv/virt: use unique QOM name
>   hw/arm/virt: use unique QOM name
>   hw/or1k/virt: use unique QOM name
>   hw/hexagon/virt: use unique QOM name
>   hw/loongarch/virt: use unique QOM name
>   hw/m68k/virt: use unique QOM name
>   hw/xtensa/virt: use unique QOM name
>   qapi: return MachineInfo typename from query-machines
>   machine: match the versioned virt example to arm virt
> 
>  hw/arm/virt.c               | 53 ++++++++++++++++--------------
>  hw/core/machine-qmp-cmds.c  |  1 +
>  hw/core/machine.c           |  6 ++++
>  hw/hexagon/virt.c           | 21 +++++++-----
>  hw/loongarch/virt.c         | 44 +++++++++++++------------
>  hw/m68k/virt.c              | 37 ++++++++++++---------
>  hw/or1k/virt.c              | 20 +++++++-----
>  hw/riscv/virt.c             | 26 +++++++--------
>  hw/xtensa/virt.c            | 20 ++++++++++--
>  include/hw/arm/virt.h       |  5 ++-
>  include/hw/core/boards.h    | 39 ++++++++++++++++------
>  include/hw/hexagon/virt.h   |  5 ++-
>  include/hw/loongarch/virt.h |  5 ++-
>  include/hw/riscv/virt.h     |  5 ++-
>  qapi/machine.json           |  6 +++-
>  system/vl.c                 |  8 ++---
>  tests/qtest/qom-test.c      | 65 +++++++++++++++++++++++++++++++++----
>  17 files changed, 247 insertions(+), 119 deletions(-)
> 

If we follow approach to register types per target bucket, we don't need
to introduce anything specific at registration time, and we would still
be able to detect duplication and propose the list of available
alternatives automatically.

```
virt is an ambiguous machine type, please choose among:
- aarch64-virt
- riscv64-virt
```

Regards,
Pierrick

