Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5D4C4167B
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 12:22:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r7adM-0007vA-TY; Mon, 27 Nov 2023 07:22:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1r7adJ-0007qc-Sr
 for qemu-riscv@nongnu.org; Mon, 27 Nov 2023 07:22:37 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1r7adH-0006TJ-QM
 for qemu-riscv@nongnu.org; Mon, 27 Nov 2023 07:22:37 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-332d2948170so2841768f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 27 Nov 2023 04:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1701087754; x=1701692554; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ciZgYiTHiyjgDISuuEjkY6lfgK7FSJWI+9ygJr8Bdr8=;
 b=HJvIFc3tkOj9v+Tq+1iFED1bDNQUr8W/4O0KtdfH+UOwKAoD07u6o+OOU/+fzixv8T
 DHhnq8O49vKdnvzQbABjWmS9CYbtOT+TIo12XohM8ezY59LmLedeTKrevUx4dzky1GO0
 fpZa4L/Nh9cLoCrAO0HrNGHkuL8yJe0XzyexE2pjufEWCf+uczD6LaaHyN4RVDGhRzPw
 csn4EXSOpKVqllraTpXhuJGssQTPRjKUPVDqnPKhgAgfK9IFc+x4YasNzgZrDCMrELSv
 O2J8BTtchJ13Rnp8zbS+nnTHYddSwz1ny8eApwajR7YGh8B/NVExZr+aSIXeshTrK4bG
 dIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701087754; x=1701692554;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ciZgYiTHiyjgDISuuEjkY6lfgK7FSJWI+9ygJr8Bdr8=;
 b=wqykcjfxohCGLODk5wBhuGtzv8I6VVs5xXqJ6F9Q5n6aiXWdiR0fc4KdUh0I6SgipU
 Oq6WzE5FhsclYPYFAB74PHvsJTcBYVQZZPi1A5MxqZTHigSi4y6MBY6mDIbpXEGInwqY
 NVaCF+H1YzstMlhY8K8zD/ZxplMPz6nz1t4Alq8/BAl7baHu97gSeqLZEkWHjNYzxn8b
 bWI6fS1ry9yr1JpHiZr5xijXzgeZ5sQRUc/k9wPQubSN5c6qRhuORKbssFI1KQjT+4/p
 JZKErPmLkVjUZM7r9aWtCledleXVZky72unSo/suG4PD9+fIkkrUr/t0i2REi0EQ1QBM
 mwKQ==
X-Gm-Message-State: AOJu0Yz7AO868u23WClAehpMhm+Zd3vjRiX9L5XK9lhgfylme1/iI0ei
 sRkHM0SZbLyw9zVDXgFFNWg5SQ==
X-Google-Smtp-Source: AGHT+IGL46EnOY/fybGOJb0l0CaUCtRjOYOSh0SxnF1JqqcHgyieNnJUyfjeNCCPaWtdOCGAjTrRMg==
X-Received: by 2002:adf:f9c4:0:b0:332:ffbc:dccc with SMTP id
 w4-20020adff9c4000000b00332ffbcdcccmr2294389wrr.0.1701087754287; 
 Mon, 27 Nov 2023 04:22:34 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 v19-20020adfd053000000b0032f79e55eb8sm11677424wrh.16.2023.11.27.04.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 04:22:33 -0800 (PST)
Date: Mon, 27 Nov 2023 13:22:27 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH for-9.0 v2 6/8] target/riscv: add 'parent' in profile
 description
Message-ID: <20231127-793fc1755f260795825209b9@orel>
References: <20231127113752.1290265-1-dbarboza@ventanamicro.com>
 <20231127113752.1290265-7-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127113752.1290265-7-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, Nov 27, 2023 at 08:37:50AM -0300, Daniel Henrique Barboza wrote:
> Certain S-mode profiles, like RVA22S64 and RVA23S64, mandate all the
> mandatory extensions of their respective U-mode profiles. RVA22S64
> includes all mandatory extensions of RVA22U64, and the same happens with
> RVA23 profiles.
> 
> Add a 'parent' field to allow profiles to enable other profiles. This
> will allow us to describe S-mode profiles by specifying their parent
> U-mode profile, then adding just the S-mode specific extensions.
> 
> We're naming the field 'parent' to consider the possibility of other
> uses (e.g. a s-mode profile including a previous s-mode profile) in the
> future.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c         |  1 +
>  target/riscv/cpu.h         |  1 +
>  target/riscv/tcg/tcg-cpu.c | 14 +++++++++++++-
>  3 files changed, 15 insertions(+), 1 deletion(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

