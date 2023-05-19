Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A464BC77B7A
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 May 2023 16:11:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q02hl-0001DI-CY; Fri, 19 May 2023 12:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1q02hk-0001Ck-6c
 for qemu-riscv@nongnu.org; Fri, 19 May 2023 12:11:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1q02hi-0005dm-Q3
 for qemu-riscv@nongnu.org; Fri, 19 May 2023 12:11:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684512701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kYmEvbwNYo4DjgLy+BIBNnAnbvYAmd61hZd2na3vlQo=;
 b=dYnsyxOINVunjPtuxcL4i3AoWTsgCi83ThMxgZ2bw3dl1PkZJEaV3krHvYlhgo3TlYJlUg
 Ou2JrhcgpF62bCE34lUngFjV7DmxBkpjYYErWa9Yt19XpCgyGplp+C9fSY/IvNtGYecST0
 +fCmFxWKUqxOYU9Qfq0zeI9PXWf2Dy4=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-DKlacWaFPY6pfod5PNaNJA-1; Fri, 19 May 2023 12:11:39 -0400
X-MC-Unique: DKlacWaFPY6pfod5PNaNJA-1
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-2536e2c336dso1011323a91.2
 for <qemu-riscv@nongnu.org>; Fri, 19 May 2023 09:11:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684512698; x=1687104698;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kYmEvbwNYo4DjgLy+BIBNnAnbvYAmd61hZd2na3vlQo=;
 b=iHi9uMZq0RWYygRJZR7XuHRv7k8R4889sVXprrU2fA6jbgHs8COKP8x/xcIb9DCq+W
 x0kLd/yPfnv854LrSGUk04Af6p8Yi0fsu12MsZ8m7f42ZM0oBj3qyXLQAhy7aAQD+61g
 deWBks336dKrci565xseBM0J4Gj5AeFeyz+Vy3m75EksEABGk1+vdWl2iIxOAPAjVo59
 Rn2lKKsfoPnCJp4YVE3j5pxVeriH1xADUQfHssvC2wsPnshXNcPIzgWNe8I7S96BVqRH
 fHVS8mh2kAM94Nkxzz6Iksc5cNZ3nUuEdS0dc4NFnfJbOYCAuyFyCwjXMJa4AYSiElWG
 jVsA==
X-Gm-Message-State: AC+VfDxVFx4OMINfyG2f0a/PyW86Lemrz3dTNsEPckRqeozEIrU9zSkF
 gh5M9YOV01zF5T11Y6RT9S6KI6xtX1sJ6HWarPHVUyVF17AQRenR5wf9owkHGfi3PPYZAf2W1bj
 WbOjw+MZWIkLvyvpcJXLU1d/gPxS9HoQ=
X-Received: by 2002:a17:90a:8c03:b0:24e:cb3:f7f8 with SMTP id
 a3-20020a17090a8c0300b0024e0cb3f7f8mr2721790pjo.46.1684512697932; 
 Fri, 19 May 2023 09:11:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5MahWyNM5C0x1fbg21vJHz6yjQHJKGTN1HKf8xR/+5LqYEkKglrO4UCus/RnjaFTTmihFcmNAy1Q68lBfkJ1o=
X-Received: by 2002:a17:90a:8c03:b0:24e:cb3:f7f8 with SMTP id
 a3-20020a17090a8c0300b0024e0cb3f7f8mr2721771pjo.46.1684512697686; Fri, 19 May
 2023 09:11:37 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 19 May 2023 09:11:37 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <20230425102545.162888-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230425102545.162888-1-sunilvl@ventanamicro.com>
Date: Fri, 19 May 2023 09:11:37 -0700
Message-ID: <CABJz62Og-9mVUfBKExMU1MG=UD7mnOKsdpeuEvXpoPTVn8TS7A@mail.gmail.com>
Subject: Re: [PATCH v2] hw/riscv: virt: Assume M-mode FW in pflash0 only when
 "-bios none"
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Tue, Apr 25, 2023 at 03:55:45PM +0530, Sunil V L wrote:
> qemu-system-riscv64 -bios <opensbi_fw> \
> -drive file=<smode_fw_vars>,if=pflash,format=raw,unit=0 \
> -drive file=<smode_fw_code>,if=pflash,format=raw,unit=1,readonly=on  \
> -machine virt

I've noticed that edk2 for RISC-V, at least in the form it is
currently packaged for Fedora, doesn't seem to have separate CODE and
VARS files:

  $ ls /usr/share/edk2/riscv/* | cat
  /usr/share/edk2/riscv/RISCV_VIRT.fd
  /usr/share/edk2/riscv/RISCV_VIRT.raw

Is that something that needs to be addressed in upstream edk2? If so,
will you be looking into it?

-- 
Andrea Bolognani / Red Hat / Virtualization


