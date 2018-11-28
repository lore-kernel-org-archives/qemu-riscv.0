Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gS6cx-0006Or-OW
	for mharc-qemu-riscv@gnu.org; Wed, 28 Nov 2018 15:40:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gS6cv-0006N2-Lc
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 15:40:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gS6cp-0002Rp-Ux
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 15:40:05 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:37641)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gS6co-0002Pp-Ax
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 15:39:59 -0500
Received: by mail-pf1-x435.google.com with SMTP id y126so2858119pfb.4
	for <qemu-riscv@nongnu.org>; Wed, 28 Nov 2018 12:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=w2uMCHgdod1vQY5ojUI5aY9W0wzlPEqPskrAW3Ha+w0=;
	b=fKZuFhBfYreylQTta+aDJo1hM2vJbFZYaSfy0b9EF4JJ/lgmu1eS1ndD8JwvumkSom
	+UiZINDQ6yZJNn9DaqX65m9lMMky02suwJeNju4BQU5D7szypuN2ZErnpBKNrgCi5Uio
	9PkoeDnUBpGkfa1rBAdQQHly/8njxP05brdyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=w2uMCHgdod1vQY5ojUI5aY9W0wzlPEqPskrAW3Ha+w0=;
	b=sxhlrPWFiz/5iN0iuve79Fkkgh4meO/yGMei8efYfP8RR4THTFtfTz5W2Ytqb+SoCl
	bzP1ttZxWPI8qgkAv0M8InJsHHXQ1SHs4hMvwVPEH0GJJQ2FvsvXyv1bOADrtsCnISPB
	ymeUpHJD3EW/52AKQlNz3cTafMONW/m5XjKieTBeIOZujIqaeWUBLNXSa5t6XgpV4nia
	ZpOR570JA/IrOKweyVv66kV4QdLYrThRdYaHQ2VoboSuersWS3xYuBdS0QSbNzxG6ILa
	IMVqNKJi3Ep0j2sQqb5kWYccf/q/eQoRfETf5gLB/yxAvTHYIwe60yl5AI2dymlc6lXE
	LfKw==
X-Gm-Message-State: AA+aEWbNEzYcoRDLWh+hbqZFJ8jMs2W7jQuwuw2grmgfQzCpZACmscfd
	yUXGRG6vaNLZpaS/QMu4faMQ4Q==
X-Google-Smtp-Source: AFSGD/VDoHurqy9WWCPpT6q8px55eecVsB1QKVM91PCjMXEJKXg/izvo1/DpkLXGH+NFi1MeEBTeGQ==
X-Received: by 2002:a65:5bc4:: with SMTP id o4mr35008212pgr.426.1543437596980; 
	Wed, 28 Nov 2018 12:39:56 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-170-180.tukw.qwest.net.
	[97.113.170.180]) by smtp.gmail.com with ESMTPSA id
	z30-v6sm10267060pfg.41.2018.11.28.12.39.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Nov 2018 12:39:56 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1543352682.git.alistair.francis@wdc.com>
	<287a8dbdfa046fc269b0f238076f25157733c66a.1543352682.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f5b9a911-038f-800d-9a7c-fe2dddbc237b@linaro.org>
Date: Wed, 28 Nov 2018 12:39:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <287a8dbdfa046fc269b0f238076f25157733c66a.1543352682.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::435
Subject: Re: [Qemu-riscv] [RFC v2 24/24] WIP: Try to patch longer branches
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
X-List-Received-Date: Wed, 28 Nov 2018 20:40:06 -0000

On 11/27/18 1:10 PM, Alistair Francis wrote:
> +        if (short_jmp) {
> +            reloc_sbimm12(code_ptr, (tcg_insn_unit *)value);
> +        } else {
> +            /* Invert the condition */
> +            insn = insn ^ (1 << 12);
> +            /* Clear the offset */
> +            insn &= 0xFFF;
> +            /* Set the offset to the PC + 8 */
> +            insn |= ((unsigned int)(code_ptr + 8)) << 12;

This isn't a pc-relative value you're storing.

    reloc_sbimm12(code_ptr, code_ptr + 2);

> +            /* Overwrite the NOP with jal x0,value */
> +            insn = encode_uj(OPC_JAL, TCG_REG_ZERO, value);

This isn't pc-relative either.  Perhaps best as

    code_ptr[1] = encode_uj(OPC_JAL, TCG_REG_ZERO, 0);
    reloc_jimm20(code_ptr + 1, (tcg_insn_unit *)value);


r~



