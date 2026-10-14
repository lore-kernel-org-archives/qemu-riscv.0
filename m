Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A795CC6B1A
	for <qemu-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 10:25:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGwAc-0001G8-Ga; Wed, 14 Oct 2026 06:25:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xGwAY-0001Ew-HA
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 06:25:10 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xGwAW-0006eh-4i
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 06:25:09 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69E667Tw3365499
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2026 10:25:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zQHXFqL1YaKMQAAXiXei3wUvfurLP9yTfTV0PqMA474=; b=Tvqx2jDjnqT0Ma7X
 MNzvcwTO0oipEctZ+Vd/cs223Lk9EvmSafYh/CmsR9/UoduVZ+zSu6ThGl7mGRkN
 pfCDagaoNQxTREcsIDfF6+xXrz+FW3+FUFVMB1S7S3LmrwC4TPMJDlbp37sKOagz
 mpDYPnoHmbViIwTX44Qut8F0T57tJ9YyEyXJsdeiyguDQs0p1SLwb943b4AaS7ev
 sZdhgbLGSO5deHKyRA7bcwzfgoUegD6ZB2iqi7Ii1/fUjcUTtNlI6dRcAgoLEnPI
 7viVAtFZJzpGyIF5jjyhBV5jVpEG/ya97wdzgxM+6EbM09zt/s+tRRUUhiQwKGMN
 f/BPOw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46212w5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2026 10:25:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-939c30aa9a0so20868685a.0
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2026 03:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791973501; x=1792578301; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=zQHXFqL1YaKMQAAXiXei3wUvfurLP9yTfTV0PqMA474=;
 b=ciINwLbkJEQkZsQGBa3PN+zbFvPPuGKZrXGLY+/sX0LpSPqQLA1KpAwz1DF8TnF39S
 Rhw3dO4Yw4xVkvGTFsxcREkSRf3O5NG4Exkpeudy/2CcWV4YgzExE/mWl9aPN503Rec4
 im+/9DOa5Ofv154Wfqxk9eOywhi8uzLNzZAvWnMvllHe5+GUWw2SzH+YQmjMfliE764i
 w6CaMijfpSfS267AM5wVLJ+46KXFsrmB38qTa4X/pau2gSIFyWm+tLyQm4GOVF7xLo+r
 WC6TCbyOLQOw6r8xN3js6SiN0b5aTt6Fn9sEiNcp09E+iUmPUg70VNFk9Ijf5Sk/Sw4F
 J9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791973501; x=1792578301;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zQHXFqL1YaKMQAAXiXei3wUvfurLP9yTfTV0PqMA474=;
 b=a5G65Z8wVnp3S9fM4Ofcjr2HTzseIojI0WpIdqHJeiJD2Hh3tTGwsbWbRnnvIWAbPo
 ot3evhO4zeu/XWtactYG3x1hGgWDqm5xlJn/YZ/VJAsSHiFKyE7dDmW1utJBlmj84kFW
 7R9XDklK+baoSphU9haBNjg854YJSoI8k6prjUmFkHO+tMS/kpk2ARw/XPv9bhd3a6Zu
 OIMUwtVJAMt94nC/BRQ4LJ98PIJwac/DSlkXsBYFUREfiiVSNfCP5y54/9+1p4xYBnnE
 hllnwcdorA6ffn8U9dsren85FnW/+MSE1QLk+m1QUSpAfTDzTOqxfNtj9hHZFIg6hHo2
 R1/w==
X-Forwarded-Encrypted: i=1;
 AKwUvBzDQsa+vCq0TqBV7FjEnbnayfcQFxlPgjGeFOPeP9Y29f4xqwtdLegRLKIniCLxGQloxmEsf6b2BRkV@nongnu.org
X-Gm-Message-State: AFq9FYJf5JV5pphh6qqc40IorQvcSRIHFMKfPvxtPS7Ts0IIlvy3tlZZ
 WkYgPpVF8CwbDjf9B97Cz/5Ns2HnNeperoQi9uBN584UvlbBUSn21ZP34zMESlTzG+or0Hqw90K
 NzffsrF2XVK/qofB9i7BA8agCj/z2CQCrJO5SoFYAoEmMkE6jfDmXxQvQhQ==
X-Gm-Gg: AYBFou3dvxDB6pf0UhHuVR3ad39ZlaRZTzHW5mf9b3tHGNGRrXZA4wA3CmegZF4+jcS
 3e1QfJ3cGYpczIUdbHIu5AOho/1swd+vBT0g0WZ/vARFxWykYu/VpEIt8lNaI/l06Fu38wot+PV
 vf8xK2dVPSJNaUMYlBGuthORSp1/LIfI3H7DhV9x7CkZnRpXRURg16wwOs3zoN2rBdP8btGpxIV
 aPOAk7QK0WennUc4RlMr99QyQwntdldkYMfF8uHJd+zju7aiU2zaXAaUaYciLn4beO+v9a6BKI2
 0gItUYj78WaZHwiqd+3u9jBX2EstYaUonO38H6NIMvJoZoBdI8k1Vtnk0XRoi32xpvPRmOJ0zoX
 SgtnwCEKUHnLK4iuLfry7pD+M1a1SBUyTOA==
X-Received: by 2002:a05:620a:2691:b0:93b:d7a2:dd2c with SMTP id
 af79cd13be357-93ebd2823e2mr2344807785a.60.1791973500862; 
 Wed, 14 Oct 2026 03:25:00 -0700 (PDT)
X-Received: by 2002:a05:620a:2691:b0:93b:d7a2:dd2c with SMTP id
 af79cd13be357-93ebd2823e2mr2344801685a.60.1791973500323; 
 Wed, 14 Oct 2026 03:25:00 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a19c8244edsm263631425e9.2.2026.10.14.03.24.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2026 03:24:59 -0700 (PDT)
Message-ID: <e09a64d3-7632-4f90-bd69-0c6097f8cd78@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 12:24:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/34] qapi: add missing Linux user-mode targets to
 EmuTarget
Content-Language: en-US
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-s390x@nongnu.org, Song Gao <17746591750@163.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Eric Farman <farman@linux.ibm.com>, Brian Cain
 <brian.cain@oss.qualcomm.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Weiwei Li <liwei1518@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 David Hildenbrand <david@kernel.org>, Laurent Vivier <laurent@vivier.eu>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fam Zheng <fam@euphon.net>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 Chao Liu <chao.liu@processmission.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <20261014093152.834-1-luoyonggang@gmail.com>
 <20261014093152.834-6-luoyonggang@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261014093152.834-6-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Salw2-Z8PXN531zwHYhg7x6jNsMA7ffS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfXzpsP8Vbwhv9q
 VgqyK6+LJYmBnERvG34SWGFHNM1qQs8kGyAJDFMgrhVartlwL8KdJPggc0GleXKaaw3JINAfM4p
 1crFzMVxEjlxdPEPCxZyIVQlSwlbA6JsLo+1l33Wy7h8mEH9l2+YyxsXtSalJ5mUOL4t2ksXubV
 r6FMCQ2aCxr8WSsaLuXM5Y2DyGL3hhhK4wT8naP7UAUvfS7e2LjV7SDdPLqbbOP78OiV9yKmhTo
 KqEwYEBHHRstr9yJYRkWbgYCLXEntooEdmZFyJ+rw7azA95c20V19zKYsNJZYRCn2iBHVrEW/0M
 rFDAdUXZx5bGQNXM8PmIw9BaMg6rq4Dw4WltHzx29K+zDCboprHXIY53R7ugSHn9oySSiTW7uJZ
 LnMIKWwAmWLUIes9bfY3adWwgBu2IcyyNE2olyvg88CE+LhbP55d0ghCXBgNNVn4CfPBPoPiUfl
 lAPggsnz1UHOauXpYBQ==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acf587d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=DWE_nywp-m4US2QJ7CsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfXyFDMShzaDvUF
 +0lfcfA9rQkcXbmubqAPMOQgiVejd2qQC2qUv55zyeVm/wfuqF7TFUMuLMgLr6zauJksl/zHYqg
 euBjfH6CgdRDBobDrtxUAVbp/TQ7w6I=
X-Proofpoint-GUID: Salw2-Z8PXN531zwHYhg7x6jNsMA7ffS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140041
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 14/10/26 11:31, Yonggang Luo wrote:
> This usermode targets:
> aarch64_be
> armeb
> microblazeel
> mipsn32
> mipsn32el
> ppc64le
> sparc32plus
> are not in machine.json
> 
> This is a prepare for directly using TARGET_ARCH_VARIANT latter.
> 
> Also get target-info.c to be compatible with future TARGET_ARCH_VARIANT only usage.
> So that we can define TARGET_ARCH_VARIANT to target_name directly
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>   include/qemu/base-arch-defs.h | 13 +++++++++++++
>   qapi/machine.json             | 25 +++++++++++++------------
>   target-info.c                 | 26 +++++++++-----------------
>   3 files changed, 35 insertions(+), 29 deletions(-)


> diff --git a/qapi/machine.json b/qapi/machine.json
> index 07fac4f0764..a3d6e08a847 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -15,11 +15,10 @@
>   
>   ##
>   # @EmuTarget:
> -#     The comprehensive enumeration of QEMU system emulation
> -#     ("softmmu") targets.  Run "./configure --help" in the project
> -#     root directory, and look for the \*-softmmu targets near the
> -#     "--target-list" option.  The individual target constants are not
> -#     documented here, for the time being.
> +#     The comprehensive enumeration of QEMU system and user-mode
> +#     emulation targets.  Run "./configure --help" in the project root
> +#     directory, and look for the targets near the "--target-list"
> +#     option.  Individual target constants are not documented here.
>   #
>   # @rx: since 5.0
>   #
> @@ -30,17 +29,19 @@
>   # @hexagon: since 11.0
>   #
>   # .. note:: The resulting QMP strings can be appended to the
> -#    "qemu-system-" prefix to produce the corresponding QEMU
> -#    executable name.  This is true even for "qemu-system-x86_64".
> +#    "qemu-system-" prefix for system emulation, or the "qemu-" prefix
> +#    for user-mode emulation, to produce the corresponding executable
> +#    name, where that target supports the respective emulation mode.
>   #
>   # Since: 3.0
>   ##
>   { 'enum' : 'EmuTarget',
> -  'data' : [ 'aarch64', 'alpha', 'arm', 'avr', 'hexagon', 'hppa', 'i386',
> -             'loongarch64', 'm68k', 'microblaze', 'mips', 'mips64',
> -             'mips64el', 'mipsel', 'or1k', 'ppc',
> -             'ppc64', 'riscv32', 'riscv64', 'rx', 's390x', 'sh4',
> -             'sh4eb', 'sparc', 'sparc64', 'tricore',
> +  'data' : [ 'aarch64', 'aarch64_be', 'alpha', 'arm', 'armeb', 'avr',
> +             'hexagon', 'hppa', 'i386', 'loongarch64', 'm68k', 'microblaze',
> +             'microblazeel', 'mips', 'mips64', 'mips64el', 'mipsel',
> +             'mipsn32', 'mipsn32el', 'or1k', 'ppc', 'ppc64', 'ppc64le',
> +             'riscv32', 'riscv64', 'rx', 's390x', 'sh4', 'sh4eb', 'sparc',
> +             'sparc32plus', 'sparc64', 'tricore',
>                'x86_64', 'xtensa', 'xtensaeb' ] }

'machine.json' is for system binaries.

If we want to expose these QAPI types to the user binaries
(I'm not sure we want...) then this declaration block should
be moved in another {qapi}.json file. QAPI types are versioned,
so we'd need some "  @aarch64_be   # Since v13.0" comments.

Anyway I doubt we want to alter EmuTarget, I'd rather let it
die as a legacy field, and expose {arch, wordsize, endianness}
to management layer if this is important to consume.

