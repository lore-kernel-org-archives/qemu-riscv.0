Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHu4P-0000l3-Oa
	for mharc-qemu-riscv@gnu.org; Wed, 31 Oct 2018 13:14:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35155)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHu4N-0000ik-24
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 13:14:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHu4K-0005yz-EE
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 13:14:15 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:39591)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gHu4K-0005yM-6E
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 13:14:12 -0400
Received: by mail-wm1-x343.google.com with SMTP id y144-v6so15198082wmd.4
	for <qemu-riscv@nongnu.org>; Wed, 31 Oct 2018 10:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=80ftR3ecKTd7C6qgF2Gwf88iAWx6C/N3IuIiMb1cN/U=;
	b=NBzNkE8Y/lo8xtnsGjt+u5ORPYZpwkfKLM7I05erhroAZANjYbXdGvrY3oni69LXu5
	jreBBvOEjNGmKIs7IyeN1komoXObZkGfELa8zjU4GzVgKs7lIlhLZx271JrXxZo3tyAz
	pNdr2wFhZSPkMUztqRyOb/y8ouUyZYANA/rsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=80ftR3ecKTd7C6qgF2Gwf88iAWx6C/N3IuIiMb1cN/U=;
	b=ZpXYQPc9HBp99N7PU9bCoX5M3CNMfNCt3YrEX+eOz+gHjD7Su1UARVD0ZJPh4fW+TC
	edvIl8an9kTC12TBbMguVaGYaI9BewkgH/lpE/AiYZ02nQWv9AQvLlUxLoqSSINuzo60
	CMv2xhu+tCSeliMPpSSxjoTjG6eii1OBd/S+9oJHrwokSUwR7WTtAoFdzM9iUogECK2+
	Aqc+Ls41GyasH9KFbd5+u60MmE3KBH07rF/C14kQJhlKpqjSxVUXPK9cuSPkD4VOsDhW
	Yk6D/p2PFdjg52dIBx0i/mwO5Z4JjAsTbE4dl6MAlC4RQvBMmQd0SdR9KQbPO0UiTPJy
	3ITw==
X-Gm-Message-State: AGRZ1gKp+g8dE+pqxNY2EgGRp4j7yHEy/Bg9t3QEajw9SEZ0l2WfSpfc
	ZTqAX5jxTm3elF+Hb2vmx9rrzq3DnhE=
X-Google-Smtp-Source: AJdET5cGeaQDwvIpwGZInU5erjPLj0oLm9Z/Z7AWSck+EaPh01INl3cbKSOGBRPxca2lOaGZqXv+Iw==
X-Received: by 2002:a1c:bc82:: with SMTP id
	m124-v6mr3217947wmf.47.1541006050719; 
	Wed, 31 Oct 2018 10:14:10 -0700 (PDT)
Received: from cloudburst.twiddle.net (79-69-241-110.dynamic.dsl.as9105.com.
	[79.69.241.110]) by smtp.gmail.com with ESMTPSA id
	c9-v6sm30285176wrh.50.2018.10.31.10.14.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Oct 2018 10:14:09 -0700 (PDT)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, mjc@sifive.com,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: peer.adelt@hni.uni-paderborn.de, qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
References: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
	<20181031132029.4887-6-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f8f8a627-80eb-5516-d4b7-01672ef7b635@linaro.org>
Date: Wed, 31 Oct 2018 17:14:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181031132029.4887-6-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: Re: [Qemu-riscv] [PATCH v3 05/35] target/riscv: Convert RV64I
 load/store insns to decodetree
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
X-List-Received-Date: Wed, 31 Oct 2018 17:14:16 -0000

On 10/31/18 1:19 PM, Bastian Koppelmann wrote:
> this splits the 64-bit only instructions into its own decode file such
> that we generate the decoder for these instructions only for the RISC-V
> 64 bit target.
> 
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
> ---
>  target/riscv/Makefile.objs              |  8 +++++---
>  target/riscv/insn64.decode              | 25 +++++++++++++++++++++++++
>  target/riscv/insn_trans/trans_rvi.inc.c | 20 ++++++++++++++++++++
>  target/riscv/translate.c                |  7 -------
>  4 files changed, 50 insertions(+), 10 deletions(-)
>  create mode 100644 target/riscv/insn64.decode

I did suggest using insn32-64.decode, so that insn64.decode is available for an
actual 64-bit instruction word, which is mentioned in the "Extensions" section
of the ISA manual.

However,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

