Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2171C9833E
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 10:39:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xB8lo-0007Q6-8p; Mon, 28 Sep 2026 06:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@oss.qualcomm.com>)
 id 1xB8lb-0007KE-Uj
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 06:39:28 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@oss.qualcomm.com>)
 id 1xB8lZ-0004O3-QC
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 06:39:27 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68S9ML7c1196202
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 10:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=wbdjjEy5yN8vbhE/lXT9XEPV
 Cfu8P5QTSjRJwcRH6mE=; b=m2lLUF9MGRNGm8eoUjEWEd3p8CwvwrqwulzZT4+z
 sclZubbXnMrU3uA9gKi7tlj4nEtOSUbhZo+/s9VcSihw+1Yx+ml1NapPCQtyLtlu
 dx75r9PIMtcWvJ0Wue8um8WIvr6cn3mFyedgs2SGOSXacP+CZP2MMGGRxw4Rughs
 BeWwn7+lW0FBQiWN6kl0UL9MIzFGrgeLTGSTZDDA984BXq1ZgliIA812MztOkHEj
 q136sBlRaPQI3ApyoKcKvOEIB1HKZG3Ob5wnPn7sG25HmuktGozOQqcDcHUMtT2T
 X3DQYbsCC1J30Idu9Gfn77CWp0vRh6BHW0KQk3hdoTUwMw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj2s14ns-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 10:39:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93bfb2da664so857886685a.1
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 03:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790591963; x=1791196763; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=wbdjjEy5yN8vbhE/lXT9XEPVCfu8P5QTSjRJwcRH6mE=;
 b=dIYc6RhnFtJ1X7dAXw7cmRsnQAHMwRGLywiOiqXzOBkZ6YspCl1zOFIvcvynB+ggNK
 3U9aVW7mTccP1aUtebrMnMQjHWiqljMTr9/u0ZHJSpqQNq3sSlhCQ+mbvj++gZ1sPoLR
 +dPbVhXIlQpqsum14zHdC2qC3jQwfk+8kQUV79zn0fnTfPSlKGlOn4MB+gxseJKI13ya
 HW9mSxRrZoN3VLUQApMd2llOXwnm7LDXLRp0bny+/MdO9yc+XBvwRWlKH1NB3c2w+1fv
 QptrYm0iOygP72fCO43HrBo16jwofmm+eKxjQnDm/fAMQILCZ02ygWE3pw5Q7P/XxfDa
 eEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790591963; x=1791196763;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=wbdjjEy5yN8vbhE/lXT9XEPVCfu8P5QTSjRJwcRH6mE=;
 b=z6VVGV3nSJdySSO8+dxHKm/mTOgckp66gLrHhdJlKk9X4rvTuKXbMiXf1Pzd1u6tHO
 TMAWjwWsXLZprcGgIX+x5zAUuGjoNWG33ySM1lpLNOMFrGJZMfXuPPFRRoiU4TGw3Dzt
 ac85xM9xu/jokZeCrK4GrOMzDovmcUqLnOe3X3TMflihTk5Uf80LD5pXImXi4l/5P0wK
 TXv7DuDJ49LGauBKLde8LPEGtBgW6vVMS4WSsvj3Y5kw+4Ysqe1GiM5FF8fxvbN7n8ZI
 NbJvkHZOl7N0NI8jCsicOx2ppElVMV9XpIda9FxbWGySrbUqS6R/1SapTAGvz2ttXb7Q
 1/lg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzbCEoIFPW5LlKdCSG+/KW2X3lIKl5pUU0l0wYwJ004Un1lyF9CCTnaOaL4aHI7Hn2WEm3U9b5HZ/oz@nongnu.org
X-Gm-Message-State: AFuF++lj+SQOmq1M4MUpMQEnyy0XxExmq2AN+ACJTn+riS87FU74MDPe
 w2hXCQ/Mj2uuigsNZ1YNFnX6wLW7ejiixv0T+XWuwJ4o5wwWTivlTGzKK6isbI5/zZoD9djh2BQ
 7XZybw0JezSanOUTY1ry6cqUyFf1Tv83EyqBog+XZV9icWLf4brLMApgw+Q==
X-Gm-Gg: AYBFou3wk6Dd0+rg7jiWE/SKcPww9nw4ftgWVtJJgCKSCxD/H7z0LCVHwFGddwf8kmW
 BPkzE4LdQ1Ke1toWMpPvwisFVdsc1tcbXAvjiMJMbiTkXe+1sunZ5FC+k00Jetxarl4iXZAZXZi
 3vPZc91/AvU7SolenF4inHLN+7cS18/h8K8aeS54QCxOWUakTo7WXeIxlsw7ALDJiALSwnoQiCK
 TVu7fYTzIFiLBfxmRA7UCV70gxB6Gk1E0PAd24Pfg6UdaVbmOlCFnG59NSnXnoiqPSYlYDCxpPn
 k6ey8ip29bmRT0rbp5DcM935Q36d9IHVoCGuFt7yUBeLeIH8mdT0OSTG81nydB07kgIi4cIWP6M
 tMKwdAcSFh4cYolmq4ONpLiUyz0QSwTaVxl7MDk1pQ4AThPO+
X-Received: by 2002:a05:620a:8906:b0:939:de48:e41f with SMTP id
 af79cd13be357-93c4749888cmr1788638785a.31.1790591962551; 
 Mon, 28 Sep 2026 03:39:22 -0700 (PDT)
X-Received: by 2002:a05:620a:8906:b0:939:de48:e41f with SMTP id
 af79cd13be357-93c4749888cmr1788633385a.31.1790591961883; 
 Mon, 28 Sep 2026 03:39:21 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2dbfde3194sm249975266b.4.2026.09.28.03.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2026 03:39:21 -0700 (PDT)
Date: Mon, 28 Sep 2026 12:39:20 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com, leif.lindholm@oss.qualcomm.com,
 Nutty Liu <nutty.liu@hotmail.com>, Sunil V L <sunilvl@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v12 3/5] hw/riscv: server platform reference machine
Message-ID: <zqapwkbxznzhlex53csmjuniomiggucyqprwxdy7x5c3ih3xzu@equyiqtv35be>
References: <20260917174405.3471736-1-daniel.barboza@oss.qualcomm.com>
 <20260917174405.3471736-4-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917174405.3471736-4-daniel.barboza@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MiBTYWx0ZWRfX1r53AS+f0GWB
 WjmnosYB6x0AOQYTJsjfbKZfKXacIml0QdELqyqxZijD//HXS07M2PPuQimzEUk4KqoW+gr05Y8
 cPNh9t4Q+11GtVVTFOrkiINKBL6j9/uxFpQ8SW4VpoxxC4X+y8qpNtQBQyJXUnMkbAI7FGsywQv
 I8B4XHyMCqyAfX2mvRBd9FRfCftjI6DuADgypUl8yYmDto9Rrf1lTgyCdY7hGth/keGEedZXBoB
 FWQTav3GvXEKWYTmVCEXcIkGhapn3YUq3xGfQqU1ZHEmUqQ11bdBmE+Xr2e956x+RehkVFfC/kv
 mjLOv6Y8CH9lA1JPAJH2msLY1kuuuJJC+pwsEqta744/ykqQwLcWWFhTbxsPQW4Y/g4bKKuLi20
 dubK33NAy7JooSWjpys3WxbSrZvDh0Y8hluGRHfR8OjaFB7W8yzP726u2+od4cqWeF3A6cemg+0
 mAOK6LjW2JIFRuQLdGA==
X-Proofpoint-ORIG-GUID: RtPII337bkhirZ-cjPhG3mCm0Ds4aD8g
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MiBTYWx0ZWRfX37957DW/jJzf
 0qhmKPiHPKp1EFVKsnU7Tv0YPtQ3GQspGvY3CHlqzPbna9MEopgLxAcKiBz9xlRcEHnJlNgm+Kn
 qk9jpGOx0zWk8znvOOLypFKZ0HpRBSU=
X-Proofpoint-GUID: RtPII337bkhirZ-cjPhG3mCm0Ds4aD8g
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6aba43db cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=NEAV23lmAAAA:8 a=NLiCwHATAAAA:8 a=EUspDBNiAAAA:8 a=69EAbJreAAAA:8
 a=FRSEYCzRAAAA:8 a=U-UTeLZP18RlJ452X3wA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=F9tHCgz3TLBaZgltkx5D:22 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280042
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=andrew.jones@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On Thu, Sep 17, 2026 at 02:44:02PM -0300, Daniel Henrique Barboza wrote:
> The RISC-V Server Platform specification [1] defines a standardized set
> of hardware and software capabilities, that portable system software,
> such as OS and hypervisors can rely on being present in a RISC-V server
> platform.
> 
> The main features included in this emulation are:
> 
> - Based on riscv virt machine type;
> - A new memory map as close as virt machine as possible;
> - An always present IOMMU platform device (riscv-iommu-sys) that uses
>   IRQs 36 to 39, one IRQ for queue, similar to the 'virt' board;
> - AIA;
> - No default AHCI (can be added via command line);
> - No default NIC (can be added via command line);
> - No virtio device;
> - No fw_cfg device;
> - No ACPI table provided;
> - Only minimal device tree nodes;
> - a platform bus for TPM support.
> 
> A note about TPM support:  TPM devices in QEMU comes usually in two
> flavors - emulated or passthrough.  A passthrough device requires a host
> TPM device that the QEMU process can borrow and it's usually coupled
> with KVM acceleration.
> 
> To use the TPM emulator we'll need help from an external TPM emulator
> called swtpm.  More info can be found in [2].  For our purposes this is
> a process that, if running Ubuntu, can be installed via 'swtpm' package.
> We'll go back to it shortly.
> 
> For now, adding support for the emulated TPM device 'tpm-tis' (other TPM
> flavors might work as well, 'tpm-tis' is the one tested with this work)
> requires a platform bus.  Adding a platform bus will open the door for
> more devices to be added in the board.  This is ok - a reference board
> isn't a restricted board and users are free to add devices at their
> leisure.
> 
> Here's how to use tpm-tis with the riscv-server-ref board:
> 
> - in a separated shell/term run 'swtpm' (--log is optional):
> 
> $ mkdir /tmp/mytpm1
> $ swtpm socket --tpmstate dir=/tmp/mytpm1 \
> 	--ctrl type=unixio,path=/tmp/mytpm1/swtpm-sock \
> 	--tpm2 \
> 	--log level=20
> 
> Then start QEMU with:
> 
> $ qemu-system-riscv64 -M riscv-server-ref (...) \
> 	-chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
> 	-tpmdev emulator,id=tpm0,chardev=chrtpm\
> 	-device tpm-tis-device,tpmdev=tpm0
> 
> [1] https://github.com/riscv-non-isa/riscv-server-platform
> [2] https://qemu-project.gitlab.io/qemu/specs/tpm.html
> 
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
> Reviewed-by: Chao Liu <chao.liu@processmission.com>
> Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>

