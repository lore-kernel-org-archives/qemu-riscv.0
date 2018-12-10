Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWPW3-0004dy-GS
	for mharc-qemu-riscv@gnu.org; Mon, 10 Dec 2018 12:38:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47991)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gWPW0-0004bT-KV
	for qemu-riscv@nongnu.org; Mon, 10 Dec 2018 12:38:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gWPVx-00077v-BY
	for qemu-riscv@nongnu.org; Mon, 10 Dec 2018 12:38:44 -0500
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:41888)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gWPVw-00075X-Sp
	for qemu-riscv@nongnu.org; Mon, 10 Dec 2018 12:38:41 -0500
Received: by mail-ot1-x333.google.com with SMTP id u16so11190395otk.8
	for <qemu-riscv@nongnu.org>; Mon, 10 Dec 2018 09:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=nPwa1KYYyYxVU9QYke5mkTZp6RVDt1a2nGWrdXfqSso=;
	b=btQ0QxOWN5/hyBQTmL5gLw5EP6rlCekBft+OZ8xmAd4XxtjKJKQmaE49h1KksWj3oP
	ph/QEC73hD1L9Q4xQOQcI4FpSj3H1T6A/gJgpONAlqzR4mLep/6He5+/XNbyqgOfkBek
	TGW2+fFLoAFGQ8SKFo8KrPKXDQYEHNnX0Dalw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=nPwa1KYYyYxVU9QYke5mkTZp6RVDt1a2nGWrdXfqSso=;
	b=mWfGjls6WmPFbks0e185TnT65Xa/mBbx4gfRO7keMKAYEN4IZ1hVrG0H8dZryEEkwK
	S/CTNt+cQ88MNYbbPRQ5aAzgVjutJEA/x0g615+hA3OVy0HODuy+7qt5Dvkm4IXJZiZs
	66Lcv2T0kpwJgLcU4XRr9xijJKNcKLVezAVJRPkbAmoO0sGzjTVh1sZnnGFjZvSEWkbk
	GwU28ZfZt+PVQ+YMEZRC52d4Ufg3o0Obn8QNSUiP42uY+vn4PYaGIvQKMlwctyqcUmk8
	t9WFFdkfq15atQUOFDRH33uXurjjUUjlUlRYZOr+W75/UuvxZpram/JOP/oL1loCKYbw
	rS2A==
X-Gm-Message-State: AA+aEWbipmuLMcXLruanZ34+xVVlajQsx4zQQEHsPsSenGL2tGlNCz/P
	YCzq1NbfMsJ89aZ5RmkTRxfAkA==
X-Google-Smtp-Source: AFSGD/XwIZ36Xaeb0T4J3qj1+t7C5+V+tOObWaXByj2g2Xtjxdn+oaXrvU+1JK8D7PiHw1QLzKZaWA==
X-Received: by 2002:a9d:3208:: with SMTP id t8mr9016496otc.312.1544463520098; 
	Mon, 10 Dec 2018 09:38:40 -0800 (PST)
Received: from cloudburst.twiddle.net ([187.217.227.243])
	by smtp.gmail.com with ESMTPSA id
	x92sm8082363ota.55.2018.12.10.09.38.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Dec 2018 09:38:39 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1544229872.git.alistair.francis@wdc.com>
	<989024c7cf2a45f6e4a7d793f7760c90e1b36e45.1544229872.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b36cd3c2-1094-10bb-670a-fdb09bd9134d@linaro.org>
Date: Mon, 10 Dec 2018 11:38:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <989024c7cf2a45f6e4a7d793f7760c90e1b36e45.1544229872.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::333
Subject: Re: [Qemu-riscv] [RFC v3 17/24] riscv: tcg-target: Add slowpath
 load and store instructions
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Dec 2018 17:38:45 -0000

On 12/7/18 6:48 PM, Alistair Francis wrote:
> +    /* Compare masked address with the TLB entry. */
> +    label_ptr[0] = s->code_ptr;
> +    tcg_out_opc_branch(s, OPC_BNE, TCG_REG_TMP0, TCG_REG_TMP1, 0);
> +    /* TODO: Move this out of line

Until you do move this out of line, you need to add the nop that you use for
normal branches...


> +    /* resolve label address */
> +    reloc_sbimm12(l->label_ptr[0], s->code_ptr);

... and use patch_reloc(..., R_RISCV_BRANCH, ...).
Or split that out to its own function too.

Otherwise this branch is going to be out of range at some point.


r~

