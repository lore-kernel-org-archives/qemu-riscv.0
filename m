Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E857C3DA7A
	for <qemu-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 17:36:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xH2tB-0001gv-D7; Wed, 14 Oct 2026 13:35:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xH2t9-0001gE-KX
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 13:35:39 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xH2t6-0005q1-R0
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 13:35:38 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69EEbRQo3813136
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2026 17:35:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kPaexnRf9zS+LN69dCeGEbXqXvBgg7OhiPBeXsfIQDY=; b=PgUDkhfmCapFshJA
 OxHHnhtvk6zbqX3e/Z0oHyYKvX+Y+je1zF9f9Ejtgn4VpUQrwkPD61vEpMYuKwDN
 1s46gCFrq3FsXcuhJzyUAfxTxhF07lNiSSYaRc3QT1FBIY14Col354urmj287I6X
 2/h573pT+qETucsA50HT6/2Up6mg+gnL00/8M1YvCTufDVUPcvToLf5phJ0FQkm4
 YDvucffjbCtmFlSz1J/C5HfvjFXcKwVi93E2xuZGFNkXK9i1F8n4Iqs2gwkfb3Z7
 A3S6qPTiVFUHNuc6ATcgNGnYWSayekO0TB4DFIvmIv5yLiR+JkTCyykw/1+bUcoK
 8DMinA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u2tj7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2026 17:35:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-35d4538fd74so3803716eec.1
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2026 10:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791999334; x=1792604134; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=kPaexnRf9zS+LN69dCeGEbXqXvBgg7OhiPBeXsfIQDY=;
 b=XoCfp3xs0XNbZzy1S6Bvy7EEjOPTrpsYPsuQPye1v985RQYg9Br9mpTGBl4nwEMEbw
 oLocwx2Iq1tZe6DuWl0dLF9S6L3BpX5XEZ45Wq2YeDcHcGP7n4s0NkhhnGUCK6HVvp4j
 FPA4ei8YGiQEVyIHE8N/X5xsZ5r55WUKVCcUqZ5hidLx0a0Sf+mJDq0ekvi0deLyQUOn
 lVoyB6wXAhpLG1dFH+Ol9uTa9GCHUZxsWAniFAOk4oVkIDj3JBWmz0jYgypXD+IeQCYP
 qeJ87UzcxA5q7DCnxnTuBDTD53d2pt3A1bo/cDkUnCv91OH2olkd1hgPMP9XQaMCgLvV
 5OAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791999334; x=1792604134;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kPaexnRf9zS+LN69dCeGEbXqXvBgg7OhiPBeXsfIQDY=;
 b=wRJtHl/eQZbt0hJ5OHqjg2ujnKTq/x1s+z7hGvwAfUo8YkHJ0hlfcP3j47IyBW82aY
 MtVa48sMGur7g5y0OcSNnHygCgJZpzVLv8nSLKB9uiAy7HA009sBGr4D7/ODhAtFKZVX
 F1cxzG6REhVMq6FphaypU02Wkt8PBwIIdoe7J4aR8Sac0AAibWdU4CVy46fO/JTpklVb
 dE3phWlDNq0+FiL1YCUotVZnDVK/IQpmkVl7TVHQcJ42UVS/jf+Mur/6LXS84ydWP43P
 4RV3fWcjIT1hfxYheSWQ03Mlc/Ar0a1ms53M02KXwUVE5w70tHWmc7BZLNZTkamBhgkI
 OOqA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwg3Hngfjadn5nFlQK4gEG8FYY9791ZJ5vjvG+GyVA0mngQmvijdo3hMs2ZXdWtEsoHLDO8Q7rK2b8/@nongnu.org
X-Gm-Message-State: AFq9FYJ/8PxCipWhXZpzQfJEZo1sRBRAsqqfHxP/HukPhJXdcwUw8gDi
 xWFvG5oBwrQ6NBygCXbaTgwioU+WrJGP0PfHfu0+R9rtN7lOHSFrkl2qAH5DBp/SbMAIBEEklN5
 6K39vpZ9dp+f/+q7c/ROBuwHr0oBVv9rltvWjDC/++F3rdJhlujVT2ZUu1w==
X-Gm-Gg: AYBFou3Qm6veBBO7UL5PuiSk2J0IoCo3KH01nVaBrWuUK5jNB9j7nKHE6uyaqVmhY40
 DJ3iyqth8cCi9z0bhj+bYN2SeWAfVlg9F5qf21RBa1wsnrcnfSRcqbBQ0CO9BRAKqZdNE6rdR7D
 dLC8/y4V1M9JOrOxG24qyKztToP8qVig6AmGAGR4KIF7PfWkwRfgJCxsVqa/yAF/6TOPKppu6SP
 P2W8BL2LDS/k40vrG12W3dP3jrwDZ3ZBC1k+N8auwVmA+EPTd+DW1Fxik+/jeuC7mNZwuM11fWi
 QTPKGaU8fhW0Hk7+KJVepnKmrpbxCdAdCInDK6OJpFTdHDTRjsCAuLbpHl5S7Rbm/W0d9lrV4Kx
 ZRSwFj4MXI1UoYiQ7CveO2lSkQTX1BoNYlwxqFKCF0oe1St6v/oORpz4PDpRFmNMtNQJxsg==
X-Received: by 2002:a05:693c:6099:b0:35e:e454:da28 with SMTP id
 5a478bee46e88-35ee454da93mr548549eec.16.1791999333696; 
 Wed, 14 Oct 2026 10:35:33 -0700 (PDT)
X-Received: by 2002:a05:693c:6099:b0:35e:e454:da28 with SMTP id
 5a478bee46e88-35ee454da93mr548442eec.16.1791999332701; 
 Wed, 14 Oct 2026 10:35:32 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3537ca6d202sm53293624eec.13.2026.10.14.10.35.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2026 10:35:32 -0700 (PDT)
Message-ID: <b0d5c95f-b08d-4a3b-9c8c-7a7575250fdc@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 10:35:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/34] single-binary: Select the softmmu target through
 -machine <type>
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
 David Hildenbrand <david@kernel.org>,
 Laurent Vivier <laurent@vivier.eu>, Fam Zheng <fam@euphon.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 Chao Liu <chao.liu@processmission.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <20261014093152.834-1-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261014093152.834-1-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA3MCBTYWx0ZWRfX2CsD+4D0ZXqx
 HnmogB2ljaieAUEvh4FySADki/uuZO/HnIT8cj+vIjiLkj6tO45xZ5DaJoJHIYOO56HhGDFQdHZ
 YYR2BsJZ0+LRmahIstNB7WcjWTPEKe0=
X-Proofpoint-GUID: 7Uo6TwSL9y1OH7SqAIdDogdPD--v5HU6
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acfbd66 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OrK7x0LPfmxmPngmsFUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA3MCBTYWx0ZWRfX3rCEb+iW8JTO
 GiJJkW1/0EJzuQkIPpS4UOC4yNE9s+397HulpTd6hJJUdLiSLI1CfFaYY/MT5H5i67FwRczfx70
 v50Ysz4mn2sGMpIfO+n65hH3s4lo/DYqNsgpTmDcrKVneldeQ3nb8YaY9hH3Aik5r0QYrnazwaY
 n5/gWvezT1zeaqfo9oq4SWnbs16S0Rka47l7kDMhnh7ioWU/K2mvM8t8xirXtK2DNd2iz55CiQ2
 6G55/RsQR/nbIwjE1mezRI//xqCU+A8zEHRRpVVNLWdCgfv35vEJxPUbu3R7GWhWtJpAcZ6Oauh
 AS9oCqs4ThcQA6MvTvEWv9wHrX7gXUoNLmMEsV1dK+1koCKblLImjxaa30aPo2ag+oIenx4WIy9
 zz/HxyQypyiKDeDWRC9WbUokOoSFgXNknP2lwWXkrNSi8AKZV/CMoNm8RGlGuyshPBAEzmBuFIF
 mnnJpz5HhWw1fwgjxtQ==
X-Proofpoint-ORIG-GUID: 7Uo6TwSL9y1OH7SqAIdDogdPD--v5HU6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140070
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

On 10/14/2026 2:31 AM, Yonggang Luo wrote:
> MachineClass::targets declares each machine's supported targets as a
> uint64_t QEMU_ARCH_* mask.
> 
> In the combined executable, a machine can be selected from
> <target>-<machine-name> when <machine-name> is ambitious.
> Otherwise we can use <machine-name> to directly select a target.
> 
> Renaming SysEmuTarget to EmuTarget prepares the enum for both system and
> user-mode targets before introducing more usage of it.
> Rationale:
> https://lore.kernel.org/qemu-devel/d6217459-1e55-4da0-a49f-bde8215d8c0e@oss.qualcomm.com/
> 
> The "virt" machines need distinct QOM names to coexist in a combined binary
> or test. Their existing CLI names and aliases are preserved.
> 
> Other indirect call of target_info() in class_init/type_init is removed by
> serveral commits, this is a prepare for select <target> by -machine $type.
> As target_info() will be NULL till the target is selected under machine_select.
> 
> The commits through "hw: add MachineClass::targets with a usage and test"
> add a minimal demo/test for introduce MachineClass::targets
> 
> The next group, through
> "meson: build combined qemu-system for multi-target configurations",
> enabled the test guard to prevent introduce future calling
> target_info() in type_init or class_init
> 
> These two boundaries provide possible merge points.
> 
> "targets" be exported along with MachineInfo in commit
> "qmp: Expose supported targets in query-machines", so that the qmp know
> how to set proper $<target>-<machine-name>.
> 
> The rest commits is the introduce of support of <target> select from
> `-machine $type`.
> 
> Yonggang Luo (34):
>   qemu/base-arch-defs: extract QEMU_ARCH_BIT for QEMU_ARCH_* enums
>   qemu: Use SYS_EMU_TARGET__MAX to define QEMU_ARCH_ALL
>   qemu: increase width of QEMU_ARCH_* masks enums to be 64 bits
>   qapi: rename SysEmuTarget to EmuTarget
>   qapi: add missing Linux user-mode targets to EmuTarget
>   meson: define TARGET_ARCH_VARIANT to target_name only
>   target-info: prepare the QOM target list before
>     module_call_init(MODULE_INIT_QOM)
>   hw: add MachineClass::targets with a usage and test
>   accel: register CPU parent for each target
>   meson: collect Rust crates for combined system target
>   module: Add module_allow_all_arch for allow all modules be loaded
>   target/arm: defer max-v8 initializer selection until CPU creation
>   hw/microblaze: defer PetaLogix endianness default until init
>   hw/pci: Avoid guard loadparm with target_s390x() for s390x in
>     class_init
>   hw/scsi: Avoid guard loadparm with target_s390x() for s390x in
>     class_init
>   hw/virtio/virtio-mem: Avoid call to target_info() in class_init
>   target-info: add a combined-binary query stub
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
>   hw: Add MachineClass.targets for all "virt" machines for all possible
>     targets
>   system/arch_init: update qemu_arch_available to handle non-target
>     select condition
>   meson: build combined qemu-system for multi-target configurations
>   qmp: Expose supported targets in query-machines
>   system/vl: select target from machine name in combined binaries
>   system/vl: handle cpu/device help properly for multi-target qemu
>   qdev: Handle device alias ambiguous under multi-target qemu
> 
>  MAINTAINERS                              |   2 +
>  accel/accel-common.c                     |   6 +-
>  accel/accel-internal.h                   |   1 +
>  accel/accel-system.c                     |  24 +++
>  accel/accel-user.c                       |   7 +
>  backends/igvm.c                          |   4 +-
>  hw/alpha/dp264.c                         |   2 +
>  hw/arm/virt.c                            |  56 +++----
>  hw/core/machine-qmp-cmds.c               |  19 ++-
>  hw/core/machine.c                        |   9 ++
>  hw/hexagon/virt.c                        |  25 +++-
>  hw/loongarch/virt.c                      |  47 +++---
>  hw/m68k/virt.c                           |  39 +++--
>  hw/microblaze/petalogix_s3adsp1800_mmu.c |  11 +-
>  hw/misc/vmlaunchupdate.c                 |   6 +-
>  hw/or1k/virt.c                           |  22 +--
>  hw/pci/pci.c                             |  18 ++-
>  hw/riscv/virt.c                          |  28 ++--
>  hw/scsi/scsi-disk.c                      |  18 ++-
>  hw/uefi/ovmf-log.c                       |   4 +-
>  hw/virtio/virtio-mem.c                   |  26 ++--
>  hw/xtensa/virt.c                         |  24 ++-
>  include/hw/arm/virt.h                    |   5 +-
>  include/hw/core/boards.h                 |  45 ++++--
>  include/hw/hexagon/virt.h                |   5 +-
>  include/hw/loongarch/virt.h              |   5 +-
>  include/hw/riscv/virt.h                  |   5 +-
>  include/monitor/qdev.h                   |   7 +
>  include/qemu/base-arch-defs.h            |  80 ++++++----
>  include/qemu/module.h                    |   2 +
>  include/qemu/target-info-def.h           |   2 +-
>  include/qemu/target-info-qapi.h          |   4 +-
>  include/qemu/target-info-qom.h           |   4 +
>  include/qemu/target-info.h               |   7 +
>  meson.build                              |  82 +++++++++-
>  monitor/monitor-hmp-internal.h           |   2 +-
>  qapi/machine.json                        |  44 +++---
>  qapi/pragma.json                         |   4 +-
>  qom/object.c                             |   4 +-
>  stubs/meson.build                        |   1 +
>  stubs/target-info.c                      |  10 ++
>  system/arch_init.c                       |  12 +-
>  system/qdev-monitor.c                    |  54 ++++++-
>  system/target-info.c                     |  10 ++
>  system/vl.c                              | 181 ++++++++++++++++++++---
>  target-info-def.c                        |   2 +-
>  target-info-qom.c                        |  26 +++-
>  target-info.c                            |  38 ++---
>  target/arm/tcg/cpu-max-v8.c              |  17 ++-
>  tests/qtest/fuzz/fuzz.c                  |   2 +-
>  tests/qtest/qom-test.c                   |  65 +++++++-
>  tests/unit/meson.build                   |   4 +-
>  tests/unit/test-multi-target.c           |  67 ++++++++-
>  util/module.c                            |  10 +-
>  54 files changed, 915 insertions(+), 289 deletions(-)
>  create mode 100644 stubs/target-info.c
>  create mode 100644 system/target-info.c
> 

Hi Yonggang,

in a previous thread, we had a long discussion about which direction we
want to go, and what needs to be implemented. I politely suggested to
focus first on simply removing dependency in class_init to target_info,
and rely on is_available only. The idea was to convince you that small
iteration steps are better than throw-all-in series. I thought we were
on the same page.

Now, yet another mega series mixing cleanup, code and even going as far
as introducing the qemu-system binary.

I feel like spending time to give advice didn't lead to a concrete
change in behavior. As a result, I'm stopping to review all those
series, and will let others drive this.

Regards,
Pierrick

