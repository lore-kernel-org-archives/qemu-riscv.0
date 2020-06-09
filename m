Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiecN-0001ck-Cd
	for mharc-qemu-riscv@gnu.org; Tue, 09 Jun 2020 09:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1jiecL-0001cS-N7; Tue, 09 Jun 2020 09:48:41 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:47354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1jiecJ-0003gr-7F; Tue, 09 Jun 2020 09:48:41 -0400
Received: from [192.168.1.12] (lfbn-gre-1-344-171.w90-112.abo.wanadoo.fr
 [90.112.62.171])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 2F81821989;
 Tue,  9 Jun 2020 13:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1591710514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kEDWIg/oJXDpgZWIX2gFKX6eMVoTF0LskEcp+BP4DMg=;
 b=BhMjMp4Fdo1UzORXkjhmB86wA0H6v089tv6res7SoxO7t3B4RdJ14BUyOWO5Ipomv2rkKX
 cVJqgSoKQRuPqKHD8TWc7xLi4kZ0eJV+pqE8wWNt5Vuakr/ws6GeXpKDoHs8GI0mm6oiBT
 McrqlHkPRCfhzqzwPysRrOI7JmPP4S4=
Subject: Re: [PATCH v5 06/11] riscv: Initial commit of OpenTitan machine
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1590704015.git.alistair.francis@wdc.com>
 <0ab3cecbe801f9e14ad1a5447d02483b9008fdbb.1590704015.git.alistair.francis@wdc.com>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <c3d7b26b-c55d-8ec5-3ee3-f197693b4378@greensocs.com>
Date: Tue, 9 Jun 2020 15:48:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <0ab3cecbe801f9e14ad1a5447d02483b9008fdbb.1590704015.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 09:48:35
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Jun 2020 13:48:42 -0000


Hi Alistair,

On 5/29/20 12:14 AM, Alistair Francis wrote:
> This adds a barebone OpenTitan machine to QEMU.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Bin Meng <bin.meng@windriver.com>
> ---

> diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
> new file mode 100644
> index 0000000000..a4b6499444
> --- /dev/null
> +++ b/include/hw/riscv/opentitan.h
> @@ -0,0 +1,68 @@

[...]

> +
> +static const struct MemmapEntry {
> +    hwaddr base;
> +    hwaddr size;
> +} ibex_memmap[] = {
> +    [IBEX_ROM] =            {  0x00008000,   0xc000 },

Shouldn't the ROM size be 0x4000 (which make the end of rom at 0xc000) ?

Not sure if that's exactly this platform you are modeling but the
following doc says the ROM size is 16kB (0x4000):
https://github.com/lowRISC/opentitan/blob/master/hw/top_earlgrey/doc/_index.md

--
Damien


