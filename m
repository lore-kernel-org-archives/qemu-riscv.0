Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CE7C43458
	for <qemu-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 04:01:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1whfwk-0005ps-Gb; Thu, 09 Jul 2026 00:01:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1whfwh-0005pF-Ef
 for qemu-riscv@nongnu.org; Thu, 09 Jul 2026 00:01:07 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1whfwf-0003mF-Uw
 for qemu-riscv@nongnu.org; Thu, 09 Jul 2026 00:01:07 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-698c0ff45b5so775929a12.1
 for <qemu-riscv@nongnu.org>; Wed, 08 Jul 2026 21:01:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783569664; cv=none;
 d=google.com; s=arc-20260327;
 b=Bej8uOsjHOmVI/xdsnph523vBCwsgW0pDxxTgfA8+TdCn6tW0giqEXxi8dt/Qv8Age
 JJWlUf0lpsMWPyiBBfUl5BDSNvWmS6If1snkq81uuP+Hay+YwltA3Ln9q52lb9xwTKGd
 RH5IlNKXHheYsiOwggajfHNjT0KygtRjd/HeDUrdU4UCymJ2LYM1nh6zzL9KwRPz3J5q
 wZFkg+k2w6GTR9birUToQUwcvJiVyH409WED8NGXWpwWP7rVq6BZfl9gL4rbUO57qvsw
 WmZDlUph5q3zDNWwKiWd52RG/4D7mCNtkom76N98kfizsSx0M+O5aVyCpdG+oAGM62YU
 QXqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=NaufSfwlWGDsZs9fUfWb+nxF9H5v26Vc5gEVxGRhtP8=;
 fh=WNVj0ml+k85QWPat6oeYaEgfT5JNKKOz7k7gZD5hZvE=;
 b=ZNy6RGn5oUqanL3WYffUNacW8oYDQ6uHTyemG4WKDX2Md0IkD1B/CR0FgCtVIO5p7V
 Bu8J1MH/Il12deekoEmVhbgRplqaqyF7ugOmHchwiQBDsh5dOS+Blufhudnt00M6kOqU
 F4/RDjoKiFgH4iV10jNsrLw3gx0CkbxK0m45eZvPT+xLEBph95fE5nEGD+CjTnPJxSng
 n2C5WfsgPDvOWii80HdpnLh+82dtQgkAwfRfW/xOCsq7e8aAV6MYeCmQNP1A2tyqRzr0
 G9I3aDqPBub/zK303eYHcP0hxlYAew9f3aWVlof59C8HZ+ZGwie1UQO1obpGS81zVO3q
 ud+Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783569664; x=1784174464; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=NaufSfwlWGDsZs9fUfWb+nxF9H5v26Vc5gEVxGRhtP8=;
 b=fSGChr0QpcZyKCg+QoKE1GkSlkXhdwFrJvy7IHvm5/jErWOx2MfCL532i+6dA8ipbM
 8l3KhcLghhbUXFAgjc8eewhsH+25Zja9C5uIyE1iZAytzhukXG+uy4/VgpU0pLMePQhs
 ddFfau3QpPlY6Zyq1vOrJXU+k6eXrsBeGBfgiY1UgtdPpxX0EVsJ03WciHECzGk4GEvv
 9CXWwccj+yQLbpkvWaoDa6Ua687jDviNmuxRdqXZW3/D/YnvJtEPsozKDhaIymyXK7lM
 BRjUCQw5MqUofiPVaHghitQtsjng2zn2KD2Tfc4UnQeQylxe2QJnXZWxjiBnlxUu99xs
 T1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783569664; x=1784174464;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=NaufSfwlWGDsZs9fUfWb+nxF9H5v26Vc5gEVxGRhtP8=;
 b=tCjgYZV69hdAV6QCS6Y2soJImO9/sPEdzJJspOwYJpa8XFE9pQDd88lE0jzM57vCy5
 zIILpG6EJRKG1XHGTdmiqda3r7J/4dZsUUmOQGpDdOE985aIPCprwPu5vVD0BTr9vulT
 tVg+LELFzlbuDRo3PRWEQjFauCusQwyMFutYLaUulhTMmipXpuCtUHsRGyWElIMs+woX
 1BiYs2EOWnc43GqN9gUoR3sG6wDIS947EPH3D+iqEKrvVvtPJJ5k4QIUXbRRq3NHelPM
 xAwJ0XekdxvAkeIBp3UpKhYW5XYU+cjqXZCcqnlQ9qDAL8d2aOUUjXG6jntyhAkABdy8
 uADg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoaGJtEvnRZ+dDbxKOA4hMZuFrTpkcf1zKuU8wKL/FK8IZnq5gZyi4SB3iQqGLqdUok4A5bndxc7u/Z@nongnu.org
X-Gm-Message-State: AOJu0Yz1GXBzNU87chd0xYq/IzvgoS5at4zVRgQ5ViSSREX/SjBFWlIX
 Oneai9AycOBbXeik/KAkDuROVyNAejKRWMEiJsqUoPjz3trA84fRoXtSIxeIagL9Or/j4+EIZKg
 WfI8akN+ggm7kNXXevXZ1/UxmsjENr24=
X-Gm-Gg: AfdE7ckVp+HzacjzABUOEvjW2YBc4rGAMT+Qx6ssr6tukIm002HeeucO0+D0sNeVbnD
 4lMqzS1n6ZCbLqJ72jOXJLtMHLbjraDKXuQT8CEzP4VZ0wyJNYO908U0bmy/EKputPflOVh/mQt
 CGjIOlPvSkPkJZ4YWnkgfDOcWMBKcxSVbbg4VuguW1A6ym24+ssJ4NsF3umAyURmBg7ZW5C3E8E
 Bed6o6Tvc2/grq2a7QfU44JoD7ljyXWsyGizhKvTkhCaG4T7QFkI7Tb8FPT+bq0Lt+wRuD7W+LX
 xUr2Bcdxh7zMWUoeUIBgbIJANVE=
X-Received: by 2002:a17:907:a45:b0:c12:c5d2:bf37 with SMTP id
 a640c23a62f3a-c15e744d7admr42721266b.12.1783569664313; Wed, 08 Jul 2026
 21:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260707072610.403595-1-wang.yechao255@zte.com.cn>
In-Reply-To: <20260707072610.403595-1-wang.yechao255@zte.com.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 9 Jul 2026 14:00:37 +1000
X-Gm-Features: AUfX_mzMJK3FhBR5WllfYAmtNYJ3YiWcweJxYLMulahN8aYBA5cvNSAX3Bymv4A
Message-ID: <CAKmqyKP40_Pc9i3HtTCCS9ueHWTE0qgSFyavTJM73S7icm5_8w@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] target/riscv/kvm: add extensions after v7.1-rc4
 update
To: Wang Yechao <wang.yechao255@zte.com.cn>
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Tue, Jul 7, 2026 at 5:28=E2=80=AFPM Wang Yechao <wang.yechao255@zte.com.=
cn> wrote:
>
> Expose zilsd, zclsd and zalasr.
>
> Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/kvm/kvm-cpu.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index dcdaf7f2b3..e2c6a4b3aa 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -303,10 +303,13 @@ static KVMCPUConfig kvm_multi_ext_cfgs[] =3D {
>      KVM_EXT_CFG("zihintntl", ext_zihintntl, KVM_RISCV_ISA_EXT_ZIHINTNTL)=
,
>      KVM_EXT_CFG("zihintpause", ext_zihintpause, KVM_RISCV_ISA_EXT_ZIHINT=
PAUSE),
>      KVM_EXT_CFG("zihpm", ext_zihpm, KVM_RISCV_ISA_EXT_ZIHPM),
> +    KVM_EXT_CFG("zilsd", ext_zilsd, KVM_RISCV_ISA_EXT_ZILSD),
>      KVM_EXT_CFG("zimop", ext_zimop, KVM_RISCV_ISA_EXT_ZIMOP),
>      KVM_EXT_CFG("zcmop", ext_zcmop, KVM_RISCV_ISA_EXT_ZCMOP),
> +    KVM_EXT_CFG("zclsd", ext_zclsd, KVM_RISCV_ISA_EXT_ZCLSD),
>      KVM_EXT_CFG("zabha", ext_zabha, KVM_RISCV_ISA_EXT_ZABHA),
>      KVM_EXT_CFG("zacas", ext_zacas, KVM_RISCV_ISA_EXT_ZACAS),
> +    KVM_EXT_CFG("zalasr", ext_zalasr, KVM_RISCV_ISA_EXT_ZALASR),
>      KVM_EXT_CFG("zawrs", ext_zawrs, KVM_RISCV_ISA_EXT_ZAWRS),
>      KVM_EXT_CFG("zfa", ext_zfa, KVM_RISCV_ISA_EXT_ZFA),
>      KVM_EXT_CFG("zfbfmin", ext_zfbfmin, KVM_RISCV_ISA_EXT_ZFBFMIN),
> --
> 2.27.0
>
>

