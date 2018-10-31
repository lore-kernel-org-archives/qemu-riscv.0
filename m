Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHu2d-00060F-I8
	for mharc-qemu-riscv@gnu.org; Wed, 31 Oct 2018 13:12:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33076)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHtyR-0002eR-EI
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 13:08:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHtyL-0001aL-Ok
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 13:08:04 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:51922)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gHtyI-0001WW-5J
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 13:07:59 -0400
Received: by mail-wm1-x342.google.com with SMTP id w7-v6so4827583wmc.1
	for <qemu-riscv@nongnu.org>; Wed, 31 Oct 2018 10:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=jKJHjCvifv5Dr91cUe2kmi993Q0y9gT5SkQWFdW+ACQ=;
	b=OAwE7tMeq8hAjnzAp0wZOr5cgogoQBLZCRqMnqHFuXHeV0LynIjOXR9SroYcMHEgjy
	cI0Vbblcd+c3GR5EjXsD13WehPJpbA3TPSwD4XeDINb9y+AyDk0DzTx9wa+nG/C0nE5N
	jnMtLLaOu+H4wHBYjtDgA/xBQHd45QE5ub73A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=jKJHjCvifv5Dr91cUe2kmi993Q0y9gT5SkQWFdW+ACQ=;
	b=kxL7sXBLiU6nTvSJD8WNCa47e507j4V8GLSj/HkEojjX//UkjpAxG3yM2QowiL3Pmh
	QNHslkSdmqFhu9J6eJq1bJoUyvyZx9XinfdIxpdjyBt0hxsEFYnnYnkIog5cyQ5fWlou
	OZ0H3KBDoDFuJyCTyt6J6RI6DV6rvfNDZMuABesvKR1EP3wJ5j9wug3EfxXZtggt9ReR
	gGB8N01JUWUPjk51eZaKc6UlWab3TMF2zSpyx27B9gIGtRxi6REjL2q5vi5cIOjnnMjI
	tsmpEjZe9GxNAHOQXnoJXXlQF5chK5qJ2RxJBg8uaYFvyYhDeLYL1/NcvM4BT54zJT0u
	Kyxg==
X-Gm-Message-State: AGRZ1gKPkUzvVYfoupfkey3kHWxDXi4tZNrovE7z1KpY4hFuYerqELNi
	c8mf5ImlzAvDk/F8s5LMfEQovaiosYc=
X-Google-Smtp-Source: AJdET5cvT1TE/SfP22QcQo4Z++de62/jv8gBJCmBm0qREJ90rfxgGMmCNOeA89MDJWLiqSSakP3M9w==
X-Received: by 2002:a1c:bb42:: with SMTP id
	l63-v6mr3022041wmf.32.1541005675297; 
	Wed, 31 Oct 2018 10:07:55 -0700 (PDT)
Received: from cloudburst.twiddle.net (79-69-241-110.dynamic.dsl.as9105.com.
	[79.69.241.110]) by smtp.gmail.com with ESMTPSA id
	109-v6sm6991883wrb.81.2018.10.31.10.07.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Oct 2018 10:07:54 -0700 (PDT)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, mjc@sifive.com,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: peer.adelt@hni.uni-paderborn.de, qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
References: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
	<20181031132029.4887-2-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9b6f4489-d441-84b4-89da-21b864b9895a@linaro.org>
Date: Wed, 31 Oct 2018 17:07:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181031132029.4887-2-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
X-Mailman-Approved-At: Wed, 31 Oct 2018 13:12:24 -0400
Subject: Re: [Qemu-riscv] [PATCH v3 01/35] target/riscv: Move CPURISCVState
 pointer to DisasContext
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
X-List-Received-Date: Wed, 31 Oct 2018 17:08:09 -0000

On 10/31/18 1:19 PM, Bastian Koppelmann wrote:
> CPURISCVState is rarely used, so there is no need to pass it to every
> translate function. This paves the way for decodetree which only passes
> DisasContext to translate functions.
> 
> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> ---
>  target/riscv/translate.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

