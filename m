Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKbCV-0005Yz-FI
	for mharc-qemu-riscv@gnu.org; Wed, 25 Jan 2023 03:32:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKbCR-0005Xn-5c
 for qemu-riscv@nongnu.org; Wed, 25 Jan 2023 03:32:07 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKbCP-0005wx-Du
 for qemu-riscv@nongnu.org; Wed, 25 Jan 2023 03:32:06 -0500
Received: by mail-wm1-x334.google.com with SMTP id m15so13139458wms.4
 for <qemu-riscv@nongnu.org>; Wed, 25 Jan 2023 00:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lgAiDMVvZQfshpzbC4dmAWLfoahPjSqo70AhNR+CR+Y=;
 b=uA4P61LkjoY8dv1zOX5JF6PXLPs1RuFu0u80vHbmrgwWUF4uFmhoVqhnUReoWxS9Gp
 WKHbKbU1M97cNvXyGb8g5jRJSgHuFatLlqonbgOzX3CfZjy+bOMrr5SGqJPaYfbUGXG1
 q2KwB+19lHtyqfTS5eMyoThsXR2a4bTOuRnY+T+ZJ38TiPin4exFqen6X4NYHVdMhqv7
 /CX5PXXLASfuvG65Xl12aXwrtFvrqA/6T9/a7cVuhrc9M/Vt0oyZEA+wS43fEpKfN61O
 hxTM4m7qU0mbqh5rmiI6CxmYhwOZM6oiKawh5hGNaFja5G0MdHhp5jkcOp7AaWByWpqy
 8kzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lgAiDMVvZQfshpzbC4dmAWLfoahPjSqo70AhNR+CR+Y=;
 b=TozqgHZ6wiJVudPssN1wfiH8JrxwuwkrVQdldMDd94ZNM3ifEEoRey7eCB0U0vtRlr
 MAv+A0sG7+JSZ7n/VmiNAWA3JUvMrQJglXIl7wjGjPd/Dxn6TO2yHTcKG3Z1R6NuE5t8
 ZgxYiX4DkXnhpn2lBJcM4rlH37o7XVC0ozbAqMrYHxfNxELy8QZuSPvwPavc3HXBt78y
 jWabJkphA8vqRqtHdmE8M1/5/DULiv70G8mB/4EgogMf9rThDMY1SDBgBUAdqvc11IMK
 SCyKm1hYDu7RTqqCVUxF61NWqTptGRRh7MD823XkG+tgmR0nDvsFst+an+OGAqQqpG3y
 elxA==
X-Gm-Message-State: AFqh2kolAYFJM+90Ho5kvVrbcWo8PPIl4r2tZvv2Xe8JSrrYpt8s1AXH
 uLtBPade4KxTBUFXE6Ya8wAVgQ==
X-Google-Smtp-Source: AMrXdXuqM5Go4vh0paC2EI6BjCs6kpn8ScH3fJUHLPEH6gbZofaACvc0aXuwWklFTMr/KVf5VCkjNw==
X-Received: by 2002:a05:600c:4d98:b0:3d3:5c7d:a5f3 with SMTP id
 v24-20020a05600c4d9800b003d35c7da5f3mr38506652wmp.37.1674635523581; 
 Wed, 25 Jan 2023 00:32:03 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a1c5457000000b003da286f8332sm983539wmi.18.2023.01.25.00.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 00:32:03 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A75F81FFB7;
 Wed, 25 Jan 2023 08:32:02 +0000 (GMT)
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
 <20230108023719.2466341-5-richard.henderson@linaro.org>
User-agent: mu4e 1.9.16; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net, Daniel
 Henrique Barboza <danielhb413@gmail.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH v4 04/36] tcg: Introduce tcg_out_addi_ptr
Date: Wed, 25 Jan 2023 08:31:57 +0000
In-reply-to: <20230108023719.2466341-5-richard.henderson@linaro.org>
Message-ID: <87wn5bqakd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
X-List-Received-Date: Wed, 25 Jan 2023 08:32:07 -0000


Richard Henderson <richard.henderson@linaro.org> writes:

> Implement the function for arm, i386, and s390x, which will use it.
> Add stubs for all other backends.
>
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

