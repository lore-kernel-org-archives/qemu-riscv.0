Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9843EC7EE22
	for <qemu-riscv@archiver.kernel.org>; Thu, 18 May 2023 09:46:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pzaDg-00050a-QV; Thu, 18 May 2023 05:46:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pzaDf-0004yU-CH; Thu, 18 May 2023 05:46:47 -0400
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pzaDd-0007eR-JR; Thu, 18 May 2023 05:46:47 -0400
Received: by mail-vk1-xa31.google.com with SMTP id
 71dfb90a1353d-44fdac26696so678455e0c.3; 
 Thu, 18 May 2023 02:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684403204; x=1686995204;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TTGha2+UDqoCQhdIBbOft/9BW9/Oywsy/b7ztAWumSM=;
 b=i6M61hsKXQZySs5SAHVXgz6IQXlotfVD/iUjtonXCCElmoyM0SnCkFzh4S/zRbum8a
 01uCXfTqG3uP9Oke5uEGx45osM2dKe9xn4ZHXsQTMN4LG4ePX2SGrNE2eLukV2ls1qsr
 WDaWoNL0AXAnVtFvvvNeHpfzrIufGvAlaMK86neXDLe4vtmPHjwEGTedbRlOxXREJV1S
 MrZYHGDSX0bS/Q9W3yO7LjWDC/Iga4kJdit2rZAfOP6vhS/k2V3xnH4bHjJ5bQ5346tW
 2SAYggtk4Ghuv//nNmfyKI4fgrLAvmDaeyBTVQSjv4IEIVq7SGbmAlRtoo3K+NzV8V59
 q2yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684403204; x=1686995204;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TTGha2+UDqoCQhdIBbOft/9BW9/Oywsy/b7ztAWumSM=;
 b=IgUU8YHxN25rgUfo5wYE0ceONw2tbl850BU8ymoaBxX4qqr4fT/Wq0crSh4Wo41J9r
 t8+RrrP0UvDjXMXy1IfLHpedmzeBFR7XdueqHWzMHsL+zlu9xHHedzinZa8kvFKA8q0e
 2/KKhqjAaTJpIUPnYHHCAKMV9Re7eoH/gPzWusDA4q79KSvSH2FAtLj2rt6aAphQ0PkF
 EyTu5Yu90qLG0l7hQ0QGtMfnRjmdT051IxANL754ePlT0md3+whjxoCYORzwebyo4HrU
 N8gwmUqmQrEgTnr5mGltJqtyoPy/ehuIWdlGBh/lVHY5+s+BXT5QbL7olIA60X4DBVLg
 iz7Q==
X-Gm-Message-State: AC+VfDy1/099ozMFG5TKQvUmXEyIKBC+hjF3dBLyzcEeimtcBngGWlPJ
 taJ2haulbarsM9+B48mKGyVA/5wI+HG6HPZyaqmWSdecBowQhSbL
X-Google-Smtp-Source: ACHHUZ7ofFP5HTQQmoXBBSHQOgaoFrcSzpcOzc/Fnt6KbLv5/jDha55LhWZsK3OOxRhQ+i3TdnzaemCb3R7RqkThCqM=
X-Received: by 2002:a1f:4513:0:b0:453:2ae:f37c with SMTP id
 s19-20020a1f4513000000b0045302aef37cmr380346vka.2.1684403204130; Thu, 18 May
 2023 02:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230517091519.34439-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20230517091519.34439-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 18 May 2023 19:46:17 +1000
Message-ID: <CAKmqyKMi+hXYe-0z=P9APn7x0zx=aiAc=eyKTy7trUUU8evq+A@mail.gmail.com>
Subject: Re: [PATCH v6 00/12] target/riscv: Fix PMP related problem
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, richard.henderson@linaro.org, 
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, May 17, 2023 at 7:16=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> This patchset originally tries to fix the PMP bypass problem issue https:=
//gitlab.com/qemu-project/qemu/-/issues/1542:
>
> * TLB will be cached if the matched PMP entry cover the whole page.  Howe=
ver PMP entries with higher priority may cover part of the page (but not ma=
tch the access address), which means different regions in this page may hav=
e different permission rights. So it also cannot be cached (patch 1).
> * Writing to pmpaddr and MML/MMWP didn't trigger tlb flush (patch 7 and  =
9).
> * We set the tlb_size to 1 to make the TLB_INVALID_MASK set, and and the =
next access will again go through tlb_fill. However, this way will not work=
 in tb_gen_code() =3D> get_page_addr_code_hostp(): the TLB host address wil=
l be cached, and the following instructions can use this host address direc=
tly which may lead to the bypass of PMP related check (original patch 11).
>
> The port is available here:
> https://github.com/plctlab/plct-qemu/tree/plct-pmp-fix-v6
>
> v6:
>
> * Update comments in Patch 1
> * Remove the merged Patch 11
>
> v5:
>
> * Mov the original Patch 6 to Patch 3
> * add Patch 4 to change the return type of pmp_hart_has_privs() to bool
> * add Patch 5 to make RLB/MML/MMWP bits writable only when Smepmp is enab=
led
> * add Patch 6 to remove unused paramters in pmp_hart_has_privs_default()
> * add Patch 7 to flush tlb when MMWP or MML bits are changed
> * add Patch 8 to update the next rule addr in pmpaddr_csr_write()
> * add Patch 13 to deny access if access is partially inside the PMP entry
>
> v4:
>
> * Update comments for Patch 1, and move partial check code from Patch 2 t=
o Patch 1
>
> * Restore log message change in Patch 2
>
> * Update commit message and the way to improve the problem in Patch 6
>
> v3:
>
> * Ignore disabled PMP entry in pmp_get_tlb_size() in Patch 1
>
> * Drop Patch 5, since tb jmp cache have been flushed in tlb_flush, so flu=
sh tb seems unnecessary.
>
> * Fix commit message problems in Patch 8 (Patch 7 in new patchset)
>
> v2:
>
> * Update commit message for patch 1
> * Add default tlb_size when pmp is diabled or there is no rules and only =
get the tlb size when translation success in patch 2
> * Update get_page_addr_code_hostp instead of probe_access_internal to fix=
 the cached host address for instruction fetch in patch 6
> * Add patch 7 to make the short up really work in pmp_hart_has_privs
> * Add patch 8 to use pmp_update_rule_addr() and pmp_update_rule_nums() se=
parately
>
> Weiwei Li (12):
>   target/riscv: Update pmp_get_tlb_size()
>   target/riscv: Move pmp_get_tlb_size apart from
>     get_physical_address_pmp
>   target/riscv: Make the short cut really work in pmp_hart_has_privs
>   target/riscv: Change the return type of pmp_hart_has_privs() to bool
>   target/riscv: Make RLB/MML/MMWP bits writable only when Smepmp is
>     enabled
>   target/riscv: Remove unused paramters in pmp_hart_has_privs_default()
>   target/riscv: Flush TLB when MMWP or MML bits are changed
>   target/riscv: Update the next rule addr in pmpaddr_csr_write()
>   target/riscv: Flush TLB when pmpaddr is updated
>   target/riscv: Flush TLB only when pmpcfg/pmpaddr really changes
>   target/riscv: Separate pmp_update_rule() in pmpcfg_csr_write
>   target/riscv: Deny access if access is partially inside the PMP entry

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu_helper.c |  27 ++---
>  target/riscv/pmp.c        | 203 ++++++++++++++++++++++----------------
>  target/riscv/pmp.h        |  11 +--
>  3 files changed, 135 insertions(+), 106 deletions(-)
>
> --
> 2.25.1
>
>

