Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWZsc-00077D-6F
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 04:33:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pWZsa-0006uy-Gi
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 04:33:08 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pWZsY-0007BC-0u
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 04:33:07 -0500
Received: by mail-ed1-x52e.google.com with SMTP id ec43so22974780edb.8
 for <qemu-riscv@nongnu.org>; Mon, 27 Feb 2023 01:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8oYTFB2bJVBpIOOr17q869UnrDe7yXBRgFS4jPUkYZ0=;
 b=j/mlljhWCV5f4mbkTF3sSemAXxrqW0d/QkPcIjBr+EIBXgVSjKlEPlV9hsWR7lDtfg
 zOg2bIT6ie7g7DVg/YMvICA2p1P5srKJewyAUnpKVPT5/goBEyOuUOTgYJ9YRqg9DzKw
 DRRqirEKUHbVucvWGad/Ctke0dH4ijcKUp1TP357LV6YMOhSb4uXPdxl7EEdg3FDKK50
 MULxxJnjHx0o+rtRt2JrwtSsFVkL+T4Vr4d6wgwfwPlE2uTCMRyLVEpT0bHmCP22S02I
 9qY3YPnCXMCcFmbCf6oK+y8/I37H2hZhdF4irp0cQxpI+QDphH7W+Lu2rzTbWSuJTcxG
 Y66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8oYTFB2bJVBpIOOr17q869UnrDe7yXBRgFS4jPUkYZ0=;
 b=RpXrD8srKJUwAey40NlsXjAtQrwNIoiAhdzb23McqrHh4ln0q4Z0Up9QcWG76cmbts
 i/upTS9Sv6R+TpjzWOqowKpLvk5qh1+Oe+wuSOtWyppIGD1QbByELgbnPriHUJx8XMaQ
 6HitirDz5tGsPvB9rTCTnEcFM3AfsVeQB2ZZDj30JrDDbqB/iaCMCBzBI3RAsgHDhZKU
 H61wOBrWEBR4ZuWR+m2yT0dUUsLsr4NUGrflUXrgljAPrWUylZJx9yvLggn7Guk1Weoe
 I+oZzkcJ5R2prdHXomZlmRhNSTYsYld9JH3EHraSOpKNg9m2CyauL4Mv3WGoiOJmBueJ
 YBhg==
X-Gm-Message-State: AO0yUKWzYKvYzmhyZmC6K9mCRsVeRs7QiqHNfjATog8wn+DgDg/4iY6V
 etF49XMH8T35NrIRHCMEodNSkNd3dNDnoZGfhaqqlg==
X-Google-Smtp-Source: AK7set9Ar84lqSxb4+NN2KE8d4nkIjRuLXQks7Ws+oC5oHAG6UcHChfe/ohqsBOZF5gKJVdCdpVIy0As2wneIKfj1UM=
X-Received: by 2002:a17:906:48c9:b0:878:4a24:1a5c with SMTP id
 d9-20020a17090648c900b008784a241a5cmr14836087ejt.6.1677490383152; Mon, 27 Feb
 2023 01:33:03 -0800 (PST)
MIME-Version: 1.0
References: <20230227090228.17117-1-ivan.klokov@syntacore.com>
In-Reply-To: <20230227090228.17117-1-ivan.klokov@syntacore.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Mon, 27 Feb 2023 10:32:51 +0100
Message-ID: <CAAeLtUCXroEK8aHCsTung81cvozFuHdZWte0JnNyRw7Wu39Azw@mail.gmail.com>
Subject: Re: [PATCH] Fix slli_uw decoding
To: Ivan Klokov <ivan.klokov@syntacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, 
 palmer@dabbelt.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Mon, 27 Feb 2023 09:33:08 -0000

On Mon, 27 Feb 2023 at 10:04, Ivan Klokov <ivan.klokov@syntacore.com> wrote:
>
> The decoding of the slli_uw currently contains decoding
> error: shamt part of opcode has six bits, not five.
>
> Fixes 3de1fb71("target/riscv: update disas.c for xnor/orn/andn and slli.uw")
>
> Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>

Reviewed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

