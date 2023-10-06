Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6681E81DE9
	for <qemu-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 11:39:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qojAd-00084k-4N; Fri, 06 Oct 2023 07:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladimir.isaev@syntacore.com>)
 id 1qojAa-0007jj-Jv; Fri, 06 Oct 2023 07:39:00 -0400
Received: from mta-04.yadro.com ([89.207.88.248])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladimir.isaev@syntacore.com>)
 id 1qojAX-0000ao-Ur; Fri, 06 Oct 2023 07:39:00 -0400
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 78019C0004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-04; t=1696592333;
 bh=xd4nevTQraENg3y2C/UieqMoauZAq9nyZOI6oSpvr3o=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
 b=URfLGtf27h3YWbpia845ibSWf7EgzlRBOaC+rPVMMadx4kyh2+6dcnsaorFqx2mV3
 NWd1DTaijHeM2wPkwVP4gbif51HirPTpFtjZDv4oc4OdoFkEU3FNH1iI96KiSkpAnM
 3+h6bEg2dApR1wGKqJGBO6Yl74UF+joqVSn/AFrZG2n1lYnyocaGEPeS0T7FMFxdPA
 6aNAoj1SzJsnLHfsEVWz1F+4z+ZzojY5e4ESN3OBwr1KXeR1B5OSNZdfPPvPcgkYmi
 I6kslvwmgZcF2P8qfQBswMlGS4pba+xQxkcqP0agxS6hnTDevDHQKWBtbxhdYfVE2X
 hUV7ubViuNDzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-03; t=1696592333;
 bh=xd4nevTQraENg3y2C/UieqMoauZAq9nyZOI6oSpvr3o=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
 b=PgQ9W5rOliL8xZmjVnvvp5VwvGve1AKvgLoTIBJyB1Bdebq9udz305ULFZHcQd+s+
 IDlM/1SItBAeqmAdu2ySYP8IxiBQG8fvjDJCTbyGvZPqwk9g3QqIyW5TBQzlezO4tN
 kEhBNaFa/hxueHWJmVh34V6q0OVcBF2jGLC+BMlaDb8mtZ9St2+7grv9L6KXR4Tm4n
 MN3BhHx9BpOSW+4JF5N/jpMBow0VE2hFd3cnLGWjciKRIcR9zqAa4jtFFPa75K071W
 cf25xTu5x+lgfpf/gTznqFYlKdjLxtHshz7iYD/GCst/GiQBsEjXgTuTXrigdk6KE+
 jZsmoGhS+iHmg==
Message-ID: <20e19d9a-c8cd-414d-ba6c-abdafbda0255@syntacore.com>
Date: Fri, 6 Oct 2023 14:38:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: pmp: Clear pmp/smepmp bits on reset
Content-Language: en-US, ru-RU
To: Mayuresh Chitale <mchitale@ventanamicro.com>, <qemu-riscv@nongnu.org>,
 <qemu-devel@nongnu.org>
CC: Alistair Francis <alistair.francis@wdc.com>
References: <20230925110946.541019-1-mchitale@ventanamicro.com>
From: Vladimir Isaev <vladimir.isaev@syntacore.com>
In-Reply-To: <20230925110946.541019-1-mchitale@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: T-EXCH-06.corp.yadro.com (172.17.10.110) To
 S-Exch-01.corp.yadro.com (10.78.5.241)
Received-SPF: permerror client-ip=89.207.88.248;
 envelope-from=vladimir.isaev@syntacore.com; helo=mta-04.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

Hi Mayuresh,

25.09.2023 14:09, Mayuresh Chitale wrote:
> As per the Priv and Smepmp specifications, certain bits such as the 'L'
> bit of pmp entries and mseccfg.MML can only be cleared upon reset and it
> is necessary to do so to allow 'M' mode firmware to correctly reinitialize
> the pmp/smpemp state across reboots.
> 
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 11 +++++++++++
>  target/riscv/pmp.c | 10 ++++++++++
>  target/riscv/pmp.h |  1 +
>  3 files changed, 22 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 0fb01788e7..561567651e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -761,6 +761,17 @@ static void riscv_cpu_reset_hold(Object *obj)
>      }
>      /* mmte is supposed to have pm.current hardwired to 1 */
>      env->mmte |= (EXT_STATUS_INITIAL | MMTE_M_PM_CURRENT);
> +
> +    /*
> +     * Clear mseccfg and unlock all the PMP entries upon reset.
> +     * This is allowed as per the priv and smepmp specifications
> +     * and is needed to clear stale entries across reboots.
> +     */
> +    if (riscv_cpu_cfg(env)->ext_smepmp) {
> +        env->mseccfg = 0;
> +    }
> +
> +    pmp_unlock_entries(env);
>  #endif
>      env->xl = riscv_cpu_mxl(env);
>      riscv_cpu_update_mask(env);
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index f498e414f0..5b14eb511a 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -129,6 +129,16 @@ static void pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
>      }
>  }
> 
> +void pmp_unlock_entries(CPURISCVState *env)
> +{
> +    uint32_t pmp_num = pmp_get_num_rules(env);
> +    int i;
> +
> +    for (i = 0; i < pmp_num; i++) {
> +        env->pmp_state.pmp[i].cfg_reg &= ~PMP_LOCK;

According to spec:

Writable PMP registers’ A and L fields are set to 0, unless the
platform mandates a different reset value for some PMP registers’ A and L fields.

So should we also set PMP_AMATCH_OFF in cfg?

Thank you,
Vladimir Isaev

> +    }
> +}
> +
>  static void pmp_decode_napot(target_ulong a, target_ulong *sa,
>                               target_ulong *ea)
>  {
> diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
> index b296ea1fc6..0ab60fe15f 100644
> --- a/target/riscv/pmp.h
> +++ b/target/riscv/pmp.h
> @@ -82,6 +82,7 @@ void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index);
>  void pmp_update_rule_nums(CPURISCVState *env);
>  uint32_t pmp_get_num_rules(CPURISCVState *env);
>  int pmp_priv_to_page_prot(pmp_priv_t pmp_priv);
> +void pmp_unlock_entries(CPURISCVState *env);
> 
>  #define MSECCFG_MML_ISSET(env) get_field(env->mseccfg, MSECCFG_MML)
>  #define MSECCFG_MMWP_ISSET(env) get_field(env->mseccfg, MSECCFG_MMWP)
> --
> 2.34.1
> 
> 

