Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EDBC98302
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 14:46:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9ODc-000488-Oz; Wed, 23 Sep 2026 10:45:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x9ODY-00043d-AD
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 10:45:04 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x9ODW-0000gO-2T
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 10:45:04 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68NBbbN73772266
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 14:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xgcOxoTBwTC0LF6Ccg2RoIG8nDW44o8mbEkBphCt1MQ=; b=lOcvg0LsZNHlJQcO
 83LWdgPgFbriVuwgIkvY1vjmlk3l0vvKq5h3c+UrBHs4eH8sUgVxSQO6/x7k7sWA
 XP9VHPwASEyTQBgKxgTVA9Qzh/Vpa4KV1F4MZcTE87LSY2YKrDyZxAD8y5rRIfqa
 0kZU1HHHHdP/tG9icKbXa+XeoO4Jnpmc1tO0ArX+MMrLhxHJ3rUnkD1MyDAzuBv5
 9e5urHMujrRvNlDJiuAx6R8rvM2q5XTIGwwp1wVaN23cB7UDJHJsv1g71ZijmXKP
 XizyejcqWjeG+hvuHg6+K8yMo852eB23u3BBgBaJ7+oAj83v3/xibK+Ja8JUaYxN
 NXqUZg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvdb60xmn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 14:45:00 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-33c35f5ca6cso1574596eec.1
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 07:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790174699; x=1790779499; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=xgcOxoTBwTC0LF6Ccg2RoIG8nDW44o8mbEkBphCt1MQ=;
 b=GZPqkApi6teEurShuwrgVEg3UgsAm+AUlotajbq5R/8hIsxqG0wpfZdrwUWNy1YrYh
 4I8/rDRpDenUmY/mu95mQTH7/bAvtn4YnQPl+LsQ5kNcZeQlyawp0sysJzCN88p4QLfP
 jSGGvT5H4zCCpNTQzshh0V35MgfsPPjY1EwznNV9hOHll2VrX3ps1Oiik6HmTTFLc1Xg
 PxQZcGxxr+mOlClCL1L9SP7uxT18t3L/DUxacbdjyVYrLu4UCLlfbaf/nhYSVL2Tihlc
 8jI/KSdx1nznfFaObbZMfzPxezp6vdAiXAasfJw1PdJCoD+0r2Wl8zdU6Ws3fR4nTzsL
 lfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790174699; x=1790779499;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xgcOxoTBwTC0LF6Ccg2RoIG8nDW44o8mbEkBphCt1MQ=;
 b=PBGtxjm6VPyAH2U8UelcfQj25CsEfWHbvh5cuqK8rX75FrULuAfQE3Q1cWLA22K8wR
 SQd/JuTLOTiUts1t1x+7W273x/8QP7NWgOW9MvkYRvn2utVO3c+JZshrf+ndVrahwqAz
 4glg8nCfsykvMpJ/aJpzJmu320mdzh1kN4lMMNRVdE8fNaqm9wOvk/DN2nQay/lOp+fu
 obN7kAFT/vlfSl2GcXDH35lSqU3gIRhk39DQnH7ozzjs1H9Y8zchMPjB4CDbIqLvqJjl
 kAgian17c/jnVksveftMw/Twmvtkdl39yEHClM+Bk2Iek82CzKBdPEwAOUn8oB26PrG8
 DqNg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwtK6Os/v6u6aLdfIub4NroCiJZyC8CI7GyPD9utmjDCxFHKYoVW2WYwLmwZ1MkLO8u1YvANOlf22Oc@nongnu.org
X-Gm-Message-State: AFuF++kf0CZnHruF9ZWuzSVJgHkqo72Nb9FR8lDw8kbrtwWajfxWKL7w
 SjpVvoNrq1kzfjIhsC4oJM3abnhMIkzGgFRHMqHYeRuYQGLJJdJ6D9iZYf2V4Lx474XWgm15H1q
 MBfeNucvfPIRvZ12FglpPmTVcURUdGpjerWpBHCqBcQYfh8BYGoJlOEmHJQ==
X-Gm-Gg: AYBFou0Lgfm6p7Pf8zNvylwoSQ6RXrWIlsQs4qXKjSrMKxGNSXKCCYKZw4MrSpXECNL
 /z3xh1fi/IXFOpFEsxyuy6chYgFIN48zRcXppxFb+UKTnuoq3BWJEz9BAuuViii5leOqfFkrYoz
 pLFdwbRtcmNqYqrozsHZQ9jOucTNzEZv1Y5dDiuETPeNd9eO7R5/ixV4vRy8StruiFq+BTUDdhl
 5dTDXL0112Sxjwg9UN5dJ/Av/xIdD8okLWff4lV/AX7sIzukeHrU7z0XWykZ2F4PlxGiEAUK/nM
 0cPAw7XsXzf4bg8dzFBzEE3syNxoWjcnOgZmVjjHBP2gLhlNjzgmYox38vIdoMVdkwZkHrMqE6y
 cAwv4KZ1VN17UzkvVW4KCvwOwrqX1HV3Jr9z4JCv8qjYsvadXRXGSBFeh3H6GZDjYjLEp6z8gFi
 RzCg==
X-Received: by 2002:a05:693c:42d9:b0:33b:e75b:cc42 with SMTP id
 5a478bee46e88-33e8d7d8b7bmr2233662eec.19.1790174698743; 
 Wed, 23 Sep 2026 07:44:58 -0700 (PDT)
X-Received: by 2002:a05:693c:42d9:b0:33b:e75b:cc42 with SMTP id
 5a478bee46e88-33e8d7d8b7bmr2233634eec.19.1790174698038; 
 Wed, 23 Sep 2026 07:44:58 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33e95c7d003sm6415514eec.9.2026.09.23.07.44.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 07:44:57 -0700 (PDT)
Message-ID: <fb2fbd8a-f362-49a9-836f-7ad271454578@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 07:44:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 000/114] single-binary: link multi-targets into
 qemu-system
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, xen-devel@lists.xenproject.org,
 Chao Liu <chao.liu@processmission.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Fabiano Rosas <farosas@suse.de>,
 Xianglai Li <lixianglai@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-ppc@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>, "Michael S. Tsirkin" <mst@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 kvm@vger.kernel.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Song Gao <17746591750@163.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Brian Cain <brian.cain@oss.qualcomm.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pJ8hkjanvUImMyjL2UbjyVRsKQMY5k__
X-Proofpoint-ORIG-GUID: pJ8hkjanvUImMyjL2UbjyVRsKQMY5k__
X-Authority-Analysis: v=2.4 cv=QeXzLcbv c=1 sm=1 tr=0 ts=6ab3e5ec cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=GaQpPoNlAAAA:8 a=pGLkceISAAAA:8 a=p0WdMEafAAAA:8 a=GSDOiBCUhkFbxXud944A:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=xF5q_uoM5gZT5J3czcBi:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1OCBTYWx0ZWRfXxxKTApVozGaL
 FeQeNhgd5SjVC1/i8B/NE2FbQaYX/OuTWd1bNIIujaCXk4FnJOTs0vRRaWhYHrXhICd/frxgtKi
 zM6Dna5C5Dj1FAk/Xg2VUZzYwqLMflw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1OCBTYWx0ZWRfX+RhvTNLgF6CT
 rRrrVIhktq5jTxWAqOAHT4T0XbItrbx2cNiXfyhLMM6QDDykmMIxlqDsggreg0TVt2FZhXPe6lE
 8wH8mLven8uDD9R1WzqgxPt8rflKUSh7azJ8k5qCx0rTS0te79h/PgNEqs0PFA1+k+7L9pK4UKE
 9GWnqCyBiZMGPQju7shq1jWhA1WximJvlbdglbkZimXcSWibyOrCenJE2Mn5xg/4Jf1xTSME4Uj
 u54Z9aYVHGWebYJSBr/Dq2ft2qr5MgDe3UCarJQkp9a6eqlkCk1Bkiqc164efSOhCJ6sTBobUQA
 CpcT9AO1s0ncZBhVHV3X1iSBMMVTf/O24Z77OArlWUq7jnZKoTQ29YKZ7BCmdtlbp4fYA8CfNUz
 OVrDAL7SRP3ri0dmVsCokbXtwXQP3C/e/PCWzYoj5rPBjOSv/dqHXjmGAB30NkWCuPnhRLCA24E
 eqhWLtq+dL4RTqQ+GKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230058
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL=1.623 autolearn=unavailable autolearn_force=no
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

Hi Yonggang,

On 9/23/2026 6:14 AM, Yonggang Luo wrote:
> This series produces one qemu-system binary that can run ARM (32 and
> 64), RISC-V (32 and 64), and MicroBlaze.
> Upstream filters machines with TypeInfo.is_available. This series
> passes a TargetInfo into that callback, uniquifies QOM names that
> collide in one process, and compiles those targets once so they can
> share qemu-system.
> 
> A combined link cannot keep C symbols or QOM type names that were
> unique only because each qemu-system-$arch was a separate binary.
> These patches remove those collisions:
> 
> - TYPE_ACCEL_CPU is the fixed abstract type accel-cpu, registered
>   once next to TYPE_ACCEL. Leaf names still encode the CPU type so
>   accel_init_cpu_interfaces() can look up "<accel>-" plus
>   target_cpu_type() (tcg-accel-arm-cpu).
> - virt QOM names are prefixed: arm-virt, riscv-virt, and the same
>   for or1k, hexagon, loongarch, m68k, and xtensa. Boards keep
>   -machine virt via machine_class_set_name(). query-machines returns
>   the QOM type in MachineInfo typename.
> - virt ACPI helpers and RISC-V TCG crc32/crc32c/wfi helpers get an
>   arch prefix so the combined link does not need meson -D name
>   mangling. LoongArch virt_acpi_setup is renamed in the same pass.
> 
> Target selection has to work with more than one TargetInfo:
> 
> - The combined binary takes arch:name on -M/-machine and in a
>   [machine] type (aarch64:virt). arch: binds the target. microblaze:
>   runs that target's default machine. arm, aarch64, riscv32, and
>   riscv64 have no default. No -M leaves target none and the empty
>   none machine. qemu-system-$arch keeps the historic -M name.
>   -M help lists every target; arch:help lists one. query-targets
>   lists each linked target, including none.
> - TargetInfo is a constructor list. target_info_select() picks the
>   entry, including SYS_EMU_TARGET_NONE. is_available takes const
>   TargetInfo *. While the target is still none, QOM skips the
>   unavailable filter so grouped -M help can list every machine.
> - query-cpu-definitions, dump notes, and Angel semihosting sit on
>   TargetCpuOps indexed by target_arch(). Registration uses a
>   QEMU_ARCH_* bitmask so one object can fill ARM and AARCH64. The
>   table is target-ops.h / target-ops.c.
> 
> qemu-system-$TARGET is still built, including the Windows *w twin.
> qemu-system is extra. It links each target whose arch sources are
> only target-info-def.c: arm, aarch64, riscv32, riscv64, and
> microblaze. Do not add qemu-systemw for that binary. A GUI
> twin would keep QEMU exporting data from the .exe into DLLs, and
> those data exports cannot be delay-loaded (qdev_prop_array and
> other qdev_prop_*). That would block enabling modules globally on
> Windows.
> 
> Examples:
> 
>   qemu-system -M aarch64:virt ...
>   qemu-system -M microblaze:petalogix-s3adsp1800 ...
>   qemu-system-riscv64 -M virt ...
> 
> A bare machine name on qemu-system needs an arch: prefix. An unknown
> target fails with "target '...' is not available".
> 
> Prerequisites:
>   [PATCH v2 0/9] machine: uniquify virt QOM names
>   https://patchew.org/QEMU/20260922215533.641-1-luoyonggang@gmail.com/
>   [PATCH 00/21] accel/tcg: share raise_excp across TCG targets
>   https://patchew.org/QEMU/20260918004225.827-1-luoyonggang@gmail.com/
>   [PATCH v5 00/11] single-binary: Compile hw/riscv once
>   https://patchew.org/QEMU/20260918-hw-riscv-cpu-int-v5-0-f98c5a244636@rev.ng/
> 
> v1: https://patchew.org/QEMU/20260823150731.896-1-luoyonggang@gmail.com/
> v2: https://patchew.org/QEMU/20260826184229.1145-1-luoyonggang@gmail.com/
> branch: https://gitlab.com/lygstate-qemu/qemu/-/tree/single-binary-arm-riscv?ref_type=heads
> x86_64 and i386: https://gitlab.com/lygstate-qemu/qemu/-/tree/combined-binary-multi-targets?ref_type=heads
>
thanks to pursue this effort.
It seems like your mail provider blocked the send after 40 patches. It
can either be:
- usually I have to reenter my password (after a timeout around 3 to 4
min) to keep on sending patches. A better way is to setup your password
in git config.
- Your reached your daily quota because there are two many cc on each
patch. Reduce cc list.

Also, I would recommend you start easy, with only two base arch as
targets (like aarch64 + riscv64). This makes the series much nicer to
review and iterate. Then you can do one series per extra target.
It takes time, but that's the only sane way to move forward.

Also, I would invite you to get the command line details reviewed first,
as it was the biggest point of discussion last time I tried this. Once
you reach a consensus, it will be trivial to add new targets in.
I'll follow any choice the community will make for this.

Regards,
Pierrick

