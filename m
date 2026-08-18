Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0311C5DF74
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Aug 2026 14:28:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wwKnE-0000OL-1E; Tue, 18 Aug 2026 10:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wwKnC-0000Ny-HQ
 for qemu-riscv@nongnu.org; Tue, 18 Aug 2026 10:27:54 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wwKnA-0002II-Rz
 for qemu-riscv@nongnu.org; Tue, 18 Aug 2026 10:27:54 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-84e84a6c4bfso1176860b3a.1
 for <qemu-riscv@nongnu.org>; Tue, 18 Aug 2026 07:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787063271; x=1787668071; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=tidpiLY8xOlHroccFPpSf1oUv/7Hp7O0PAyloc2Wj4s=;
 b=ZZwFqMnEfb2ZJsdLpZ58zyk7nY+cMJn2ekz6kaKWP0U9mqTpLAMi9UvSj6OJWI4Nu0
 RjFUZ3xgvwaRcY3izTKiCGdnTuTgiGAFZGaedtvkNDdt+MOZuo1kzvVXxbnuLXQO/UXD
 xEnw5vD1ttKEgKxeLRqo8k2Kz+ZG2xEy3/HzFYx573OJzQLhmOQc3TS2YKJO6L0zn0T3
 pr53vwnrrq48H48V0zVpZY3CqjSLwh/+/972DrykESsS9v2frhiAUj/r4iOzWHKj5MT7
 fYXfnPjIpVQIIpF5wcOG3M/+6xqcQtOzcVPrZmR+V8hqwtHI7FZdptzRCKTPDJfdTBfm
 xCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787063271; x=1787668071;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tidpiLY8xOlHroccFPpSf1oUv/7Hp7O0PAyloc2Wj4s=;
 b=Jj8YADh6vkkNTRmJ9BSQHEDAznrbKsj8k9CNujYoTGBpwEGKineX7PGXIwfj22bvT7
 HabSvw02WIX10sYtCH7iRVvVoc623G+X1TmGpl9sJuM0BOrh9HALaDHxnWbWNHAm3/zY
 dcivVasErRYdGdoMhJCsXwp/ePiow6SBWotrcIah//Q6TwxFmVIfno3cekUmTh4eMIpg
 YifwQUoYe3xj2B7tY2iB5IVqb+4IizJO8+xww5nstQiyjBfIYbfjNPNh0v6MTRlqywJ2
 q39zVPojAW2R38aI265mCrI9ozFVPXFhDmfQmPphPV/+nTc2NzB8CnfiWBW38wFPV4pF
 yUxA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq1EMfYBX8oaaBTMxUsihcRTIe4scYmhCvpRZ2MjVtbnXKlFzqXoHkISfrcjD0aVE3HhGXtzl1C+ZCl@nongnu.org
X-Gm-Message-State: AOJu0YzoO/TtEIxQn7up9eO1z3/V1wVhCbN6VpvXbVy0PaSCDwxQewg2
 JvKnFvlB3ZiU0/D6LV+UuiGlaYNzxVCgvic/bNHoo+GnZGdGZREQBriaxHl0pS9tMBg=
X-Gm-Gg: AR+sD11NUru8UJxjt35FB4gOs5wQcAFY0ESZKjV39V2nTC6EwqpHhex0UqKTlEQvXHs
 Nkq/dBAKCDQ8V20hdHRRIg2Bdw74B+CE3jG3VsSQpmhnlHPElLydqbSmD1F3UGZ5ZF9/25XBb+g
 86g7lplNJn/RCTRyIXkDQfUmMC55bp3p6ecHKgu3OH3C/UADR1OgRBPTiGYv5DY5oj+EHVTFsgJ
 Nf34eR3qwuIOu7P2EnINtG0eb2ZHdZRyZwyZkmuDXibceQVJ8cquJJ+6dORgK9d7wURikzqWG3L
 NGuUgRg0e+LLgJa1yHQbwJffILQGA8qdwUjCU5YPncs9QFDD73S66rAJEHefmGMJK7LAWyREa2M
 drCCL9IRix7DpYGz4NvMljtCbXTMAc33WZngItpFUG+f9PK6Ry1QTG0MKV2VGxUUb7a8uHfZlFV
 +cBD7uniu+nWFT9X5svINqaeSpRlHlp4m+GwGMFMpX0J2SIBs+kAgat/Vuibssp0kVkjp7KNmNF
 8kU7FKxmkeTHqaqXN7Q/6/8zhXuglvlP4Vx01+j8tZv7Xk=
X-Received: by 2002:a05:6a00:10cf:b0:847:9dd7:2683 with SMTP id
 d2e1a72fcca58-851bc380e98mr6749756b3a.9.1787063270961; 
 Tue, 18 Aug 2026 07:27:50 -0700 (PDT)
Received: from [10.213.131.227] (c-73-181-156-132.hsd1.wa.comcast.net.
 [73.181.156.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-851b4046f59sm1926435b3a.18.2026.08.18.07.27.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 07:27:50 -0700 (PDT)
Message-ID: <890d66d1-826a-46c7-824f-e8ff8f84db69@linaro.org>
Date: Tue, 18 Aug 2026 07:27:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/tcg: Allow overlapping reads in record_save
To: Ilya Chichkov <ilya.chichkov.dev@gmail.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org
References: <20260814142159.3800744-1-ilya.chichkov.dev@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260814142159.3800744-1-ilya.chichkov.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 8/14/26 07:21, Ilya Chichkov wrote:
> record_save() assumed that a target reads the bytes of an insn as a
> strictly ascending sequence of adjacent chunks, and asserted that each
> read begins exactly where the previous one ended.
> 
> That assumption no longer holds for riscv.  Since f9eaa1542b
> ("target/riscv: support atomic instruction fetch (Ziccif)"),
> decode_opc() loads a full aligned word whenever pc is 4-byte aligned,
> even when the insn turns out to be a 2-byte compressed one, so the
> record may already hold bytes past the end of the insn being
> translated.  When such a compressed insn sits at page offset 0xffc,
> pc_next becomes 0xffe, which is within MAX_INSN_LEN of the end of the
> page, and riscv_tr_translate_insn() probes the next insn to decide
> whether it would cross the page boundary.  That probe reads at offset
> 2 while the record already covers [0,4), and the assert fires:
> 
>    qemu-system-riscv32: accel/tcg/translator.c:395: record_save:
>    Assertion `offset == db->record_start + db->record_len' failed.
> 
> record_save() is only reached when the insn is fetched from MMIO, so
> this is visible on boards that execute code from a region created with
> memory_region_init_io(), such as an XIP flash window mapped over a
> serial flash controller.
> 
> Both sides of the collision are correct: the wide fetch is required for
> Ziccif atomicity, and the probe is required for correct fault reporting
> at a page boundary, per 00c07344fa ("target/riscv: Make translator stop
> before the end of a page").  Unlike a86d3352ab ("target/riscv: do not
> use translator_ldl in opcode_at"), where a non-translation caller had
> no business using translator_ld*, the probe here is a genuine
> translation read whose bytes must be recorded.
> 
> Relax the invariant instead.  Keep requiring that a read neither moves
> backwards nor leaves a gap, but let a read overlapping the recorded
> range extend it only by the bytes past its end.
> 
> Fixes: f9eaa1542b ("target/riscv: support atomic instruction fetch (Ziccif)")
> Signed-off-by: Ilya Chichkov <ilya.chichkov.dev@gmail.com>
> ---
>   accel/tcg/translator.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Applied to tcg-next.

r~


