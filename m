Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C36EB64DC
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Jul 2023 00:32:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLYdg-0000c5-3z; Mon, 17 Jul 2023 20:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1qLYdb-0000bh-Ul; Mon, 17 Jul 2023 20:32:24 -0400
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1qLYdZ-00055C-2F; Mon, 17 Jul 2023 20:32:23 -0400
Received: from [192.168.0.120] (unknown [180.175.26.191])
 by APP-03 (Coremail) with SMTP id rQCowAAHKGWD3bVk3HEbDA--.61478S2;
 Tue, 18 Jul 2023 08:32:04 +0800 (CST)
Message-ID: <d5a1b09e-0519-b193-4158-e9ddee18d03f@iscas.ac.cn>
Date: Tue, 18 Jul 2023 08:32:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH] target/riscv/cpu.c: check priv_ver before auto-enable
 zca/zcd/zcf
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
References: <20230717154141.60898-1-dbarboza@ventanamicro.com>
Content-Language: en-US
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <20230717154141.60898-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: rQCowAAHKGWD3bVk3HEbDA--.61478S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAF47JryUZF4rAr4DCFy5CFg_yoW5Gw43pF
 Wjk3yakr4kJF97Ga4xJ3W7Xr17Cws09ayxJanYgw18u3y3Ar4Ygr97Kw48ua48JFs3Cr4a
 93WqyryYvr47A3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
 4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-Originating-IP: [180.175.26.191]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.81; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.097,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


On 2023/7/17 23:41, Daniel Henrique Barboza wrote:
> Commit bd30559568 made changes in how we're checking and disabling
> extensions based on env->priv_ver. One of the changes was to move the
> extension disablement code to the end of realize(), being able to
> disable extensions after we've auto-enabled some of them.
>
> An unfortunate side effect of this change started to happen with CPUs
> that has an older priv version, like sifive-u54. Starting on commit
> 2288a5ce43e5 we're auto-enabling zca, zcd and zcf if RVC is enabled,
> but these extensions are priv version 1.12.0. When running a cpu that
> has an older priv ver (like sifive-u54) the user is spammed with
> warnings like these:
>
> qemu-system-riscv64: warning: disabling zca extension for hart 0x0000000000000000 because privilege spec version does not match
> qemu-system-riscv64: warning: disabling zcd extension for hart 0x0000000000000000 because privilege spec version does not match
>
> The warnings are part of the code that disables the extension, but in this
> case we're throwing user warnings for stuff that we enabled on our own,
> without user intervention. Users are left wondering what they did wrong.
>
> A quick 8.1 fix for this nuisance is to check the CPU priv spec before
> auto-enabling zca/zcd/zcf. A more appropriate fix will include a more
> robust framework that will account for both priv_ver and user choice
> when auto-enabling/disabling extensions, but for 8.1 we'll make it do
> with this simple check.
>
> It's also worth noticing that this is the only case where we're
> auto-enabling extensions based on a criteria (in this case RVC) that
> doesn't match the priv spec of the extensions we're enabling. There's no
> need for more 8.1 band-aids.
>
> Cc: Conor Dooley <conor@kernel.org>
> Fixes: 2288a5ce43e5 ("target/riscv: add cfg properties for Zc* extension")
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li

>   target/riscv/cpu.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 9339c0241d..6b93b04453 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1225,7 +1225,8 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           }
>       }
>   
> -    if (riscv_has_ext(env, RVC)) {
> +    /* zca, zcd and zcf has a PRIV 1.12.0 restriction */
> +    if (riscv_has_ext(env, RVC) && env->priv_ver >= PRIV_VERSION_1_12_0) {
>           cpu->cfg.ext_zca = true;
>           if (riscv_has_ext(env, RVF) && env->misa_mxl_max == MXL_RV32) {
>               cpu->cfg.ext_zcf = true;


