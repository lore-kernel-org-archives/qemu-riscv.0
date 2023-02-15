Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSFsf-0000fY-L2
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 06:23:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSFsa-0000bg-Sb; Wed, 15 Feb 2023 06:23:17 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSFsY-0000kQ-Ag; Wed, 15 Feb 2023 06:23:15 -0500
Received: by mail-ed1-x52b.google.com with SMTP id d40so20298019eda.8;
 Wed, 15 Feb 2023 03:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hAvXoVczJG6syLQqfxMmtbVn0jNx1tQcZCLTdIT7E08=;
 b=aBvkBgjVr285axh2AX/45DC4cfqDsvdAlA3BxA0DWpcZ+X2aXPzK8Vtu60IXrMQIxc
 eeWjvv+ReR/XKoH0dyrznLlh7duXm6N5CJOT2TP2As3ftu3DCgO3LdyjFQh+kgbYQrTf
 NvUiup0VxUUPezjhERuQKMO6cmJTRJJkqF87GtJNyZF6YUHNzdyUSmsn6Ix8F6mlHBbR
 jGg+F+HArMiw6QJmD6RJDY/Tn2nWgG2kGsJZx1HU7v2CdHj9ntUrwQKJlwquF6wVfOJr
 MNDi96GvT3F6jjIy8JzLUsS1XEoVdPk0VczTCQ/gfE1652vURAdATNacAChK/A/OYU4P
 9LIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hAvXoVczJG6syLQqfxMmtbVn0jNx1tQcZCLTdIT7E08=;
 b=pnPTbAi1VsXLxknQwBrah03vMtPiqfVFBXvozT87b95jcUxCrhio4OYpVKU6O4KapH
 fksUTLAOpG7YcA4wClrL5OsCqYtwY/V195kKh6nQKOo+nQX1R405OG+ldzzYy15Dgg7D
 xq+ugVtAGgZvTPOzaTmTvcpmWALmKyrvFhFKoVRZHlNvO88HXAofJf8ohIx+Byyyckuv
 OC56MkE6HXiBT1UPERAJosSWfjQOXaoax8LNiW8OBijE+wKj0NKbhG3s47OsbDORjXYD
 hTqojUVXpN5bUhmZ9p+wE/jEbaCNkC3IPmfT1iAVIDERXRpf2bZL+iSs0fZbRFH2fhU0
 fMYQ==
X-Gm-Message-State: AO0yUKXXuFJizU1FhdzDgHZEwLxJlzEexu+7ojAfvxZBXO21SYjE6KDL
 xuImpqe5fvqlsRnBikNApTwZe21qfiuU6TCyxTI=
X-Google-Smtp-Source: AK7set/KhAw0Y/jsC08fo1qiBo1tCRLehErLiAJHyezI0Pg+VL+qXQEMizI3zlehCpicSE68d6H7mbecXnYQukSVUvs=
X-Received: by 2002:a50:d653:0:b0:4ac:b618:7fb1 with SMTP id
 c19-20020a50d653000000b004acb6187fb1mr842417edj.6.1676460189463; Wed, 15 Feb
 2023 03:23:09 -0800 (PST)
MIME-Version: 1.0
References: <20230214192356.319991-1-dbarboza@ventanamicro.com>
 <20230214192356.319991-12-dbarboza@ventanamicro.com>
In-Reply-To: <20230214192356.319991-12-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 15 Feb 2023 19:22:57 +0800
Message-ID: <CAEUhbmWvTzj=29CASB0o2bkeJW0HTyEoKfFTL_1CaJPK6iGMvA@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] target/riscv/cpu: remove CPUArchState::features
 and friends
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52b.google.com
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
X-List-Received-Date: Wed, 15 Feb 2023 11:23:19 -0000

On Wed, Feb 15, 2023 at 3:26 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The attribute is no longer used since we can retrieve all the enabled
> features in the hart by using cpu->cfg instead.
>
> Remove env->feature, riscv_feature() and riscv_set_feature(). We also
> need to bump vmstate_riscv_cpu version_id and minimal_version_id since
> 'features' is no longer being migrated.
>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.h     | 12 ------------
>  target/riscv/machine.c |  5 ++---
>  2 files changed, 2 insertions(+), 15 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

