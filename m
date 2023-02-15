Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSFsg-0000gr-B5
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 06:23:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSFsR-0000Yv-AK; Wed, 15 Feb 2023 06:23:08 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSFsP-0000jh-RD; Wed, 15 Feb 2023 06:23:07 -0500
Received: by mail-ej1-x635.google.com with SMTP id lf10so15491768ejc.5;
 Wed, 15 Feb 2023 03:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=v69mwlgmqjMcHTdmCYIlOEA7Ff6BE019NBMkEtlAR5A=;
 b=oqRce/jlR/qXjd+GvwIMpQHJIpgzEWyoeOpGk23KSxG16KpSrxkkWVjrYUtWrAJbR+
 hlaaizQ1FFdHbT4AkdEvm9jAXM3aYtFBsr7bMa+Fid+xP+Nyh+/yh6y5eZJY1zwTIM7Z
 sKDljE4mfXo8Pe0tfbxZbgAIefZKh2P2Hlb7kX9bh72vGR6G7CJh6Uc/V+eMtdbUaUG+
 kisHRCOBFxUSyPrJEuSEys68l++C/rf/e34TQduwM3WZJeYtkVZ7C57VLmHNFVjEfTWC
 t5xg3lgGCln6D+/oMnrV18GRIefxx7IuVRiN+m5e7DFmObvpW+oiD3h+CBUDJ8Wjvy5n
 aV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v69mwlgmqjMcHTdmCYIlOEA7Ff6BE019NBMkEtlAR5A=;
 b=lWpfaK34KMdnMsGoBZELtK0d3Bz+Mk0yWqYUL1Q8WAmN5pjMywMKaCNAppdniAdg6T
 RS2fCr7UmlBhB8adVi9w5DO44mqe8bjxrbdmzt1/tcB8ss/gBQzocAJeYuA6JFc0N5fO
 6/dQi2rjlCAIZcfrRELnvTjfffUoOb7FgxHJWe3Yq8//b5PxOhK5Z4jsdx4ysJkGgj4A
 Llc/88MxbUV0QT8a6tQl3uVFBUS/JagEfkqUwSuuCkWMVDDJdGJcxjSAlpb3MEECKQzH
 swCghhSJ905r7KPunPIhCU2ywx8VrunwmuBiq0KyCzHX0oOWgjWKH4NeAVKlLxnbXCov
 RxcA==
X-Gm-Message-State: AO0yUKW7nr+6D/devCYSRbgQJ+zmIBmU5KpWdUXxJOGdhbWyhDlS6GTR
 BHRt/l8PBblNofSDasNGpG+cTfiqZXsT9UQOcc4=
X-Google-Smtp-Source: AK7set8oVIX9uWkyMGi+Cyx5J3MfyAt/x9TO05fwrg3lzUP+Ye+/iFhDRU5D+BhTmGWKmkF35sr0sxU4r9rpAvUIQTU=
X-Received: by 2002:a17:906:ce49:b0:8b1:3cdf:29cd with SMTP id
 se9-20020a170906ce4900b008b13cdf29cdmr878759ejb.6.1676460183610; Wed, 15 Feb
 2023 03:23:03 -0800 (PST)
MIME-Version: 1.0
References: <20230214192356.319991-1-dbarboza@ventanamicro.com>
 <20230214192356.319991-10-dbarboza@ventanamicro.com>
In-Reply-To: <20230214192356.319991-10-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 15 Feb 2023 19:22:51 +0800
Message-ID: <CAEUhbmV6WELftUMq+2RAj8vnhEThiwHhO9=MtfWz6SjfKBtuoQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] hw/riscv/virt.c: do not use RISCV_FEATURE_MMU in
 create_fdt_socket_cpus()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 15 Feb 2023 11:23:12 -0000

On Wed, Feb 15, 2023 at 3:25 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Read cpu_ptr->cfg.mmu directly. As a bonus, use cpu_ptr in
> riscv_isa_string().
>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/virt.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

