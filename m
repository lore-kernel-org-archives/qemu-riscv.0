Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gm3iw-0006Fz-DL
	for mharc-qemu-riscv@gnu.org; Tue, 22 Jan 2019 16:36:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57277)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gm3it-0006EB-BD
	for qemu-riscv@nongnu.org; Tue, 22 Jan 2019 16:36:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gm3is-0003Lf-Gz
	for qemu-riscv@nongnu.org; Tue, 22 Jan 2019 16:36:43 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:33867)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gm3iq-00036P-Hg
	for qemu-riscv@nongnu.org; Tue, 22 Jan 2019 16:36:40 -0500
Received: by mail-pf1-x443.google.com with SMTP id h3so32874pfg.1
	for <qemu-riscv@nongnu.org>; Tue, 22 Jan 2019 13:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=47UKrSAgqy6QaQxdrPcf8y1RERe+DgWUn47g3e8/wmg=;
	b=RMgv11bd2TBHoiKpgVDo7nmLIliyhA2t1FqDmhrzKdKuiFjkx1ucc9PbTIqpArVD5H
	l5aR1FvsyTAk+ZKoz+97gv0csfAM4lR8Ss6jEovJwBE/YtdJ1n6RJ28t008UcpJ2+/Pp
	45IE2Xw/b4OdecGX0J7WpX6DkkMll31LdwcQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=47UKrSAgqy6QaQxdrPcf8y1RERe+DgWUn47g3e8/wmg=;
	b=T/j/2xzZ78OhrfDtU/PpsdyoFBqjEiZ5imRxJWOYrWKJFnAcy5t11dwvR2RlqZS3xW
	U5dj3Dr/vTG1RiDUlXmi95lEzS/zpBXSJTh5x7OkhoZqdzwKsxZOhkJblM4gpG7ueehT
	BGiFSBRZ+y70V7EoXdX933WfzRoc7sjlM7PD4q0aT3Dd1Y2+wrknVEklPXbAvVH/0sOL
	oiNaVQw/vIK/m8Q9pFsl/P8VAPguh7Hb6YQg01WA/YjWvXrzr8rHj4C7w8KCIlM6fT9u
	VDG2Ose6qxNnyJe6HIjdMFL3mETu/KjYe8jKORc/NuoHUrr+eWzdzSyMuJzakvKvGCMZ
	/u6w==
X-Gm-Message-State: AJcUukdHlyCdW6DmNNEetxmfJa9lb5tJZq+uuDfV0r8TcWpsxMf33Pge
	mjXxqhGUYtO69vhNNBkQYdOzFg==
X-Google-Smtp-Source: ALg8bN7Zy93x5PJ/h7YS6utY3CMzEkLsKn9odiAaKWBk4lnZv9o5lJcaiRMSIKvA+zuMx/Nx3wNeKA==
X-Received: by 2002:a63:4b25:: with SMTP id y37mr34529014pga.181.1548192986645;
	Tue, 22 Jan 2019 13:36:26 -0800 (PST)
Received: from cloudburst.twiddle.net ([170.173.8.12])
	by smtp.gmail.com with ESMTPSA id
	s130sm35962034pgc.60.2019.01.22.13.36.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jan 2019 13:36:25 -0800 (PST)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	sagark@eecs.berkeley.edu, palmer@sifive.com
Cc: peer.adelt@hni.uni-paderborn.de, qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
References: <20190122092909.5341-1-kbastian@mail.uni-paderborn.de>
	<20190122092909.5341-25-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5ee17273-237a-8581-fe22-30aa667e770c@linaro.org>
Date: Tue, 22 Jan 2019 13:36:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190122092909.5341-25-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: Re: [Qemu-riscv] [PATCH v5 24/35] target/riscv: Move
 gen_arith_imm() decoding into trans_* functions
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
X-List-Received-Date: Tue, 22 Jan 2019 21:36:45 -0000

On 1/22/19 1:28 AM, Bastian Koppelmann wrote:
> gen_arith_imm() does a lot of decoding manually, which was hard to read
> in case of the shift instructions and is not necessary anymore with
> decodetree.
> 
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +    if (a->shamt >= TARGET_LONG_BITS) {
> +            return false;
> +    }

Watch the funky indentation.

> +    if (a->rd != 0) {
> +        TCGv t = tcg_temp_new();
> +        gen_get_gpr(t, a->rs1);
> +
> +           tcg_gen_sari_tl(t, t, a->shamt);
> +        gen_set_gpr(a->rd, t);

Likewise.


r~

