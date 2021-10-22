Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdq7c-00008u-Sa
	for mharc-qemu-riscv@gnu.org; Fri, 22 Oct 2021 04:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mdq7S-00006Q-Rs; Fri, 22 Oct 2021 04:41:46 -0400
Received: from atcsqr.andestech.com ([60.248.187.195]:14093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mdq7P-0008Ta-Ml; Fri, 22 Oct 2021 04:41:42 -0400
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 19M8YVOk000178;
 Fri, 22 Oct 2021 16:34:31 +0800 (GMT-8)
 (envelope-from ruinland@andestech.com)
Received: from ruinland-x1c (192.168.21.142) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Fri, 22 Oct 2021
 16:34:29 +0800
Date: Fri, 22 Oct 2021 16:34:28 +0800
From: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
To: Richard Henderson <richard.henderson@linaro.org>
CC: <alistair23@gmail.com>, <wangjunqiang@iscas.ac.cn>, <bmeng.cn@gmail.com>, 
 <ycliang@andestech.com>, <alankao@andestech.com>,
 <dylan@andestech.com>, <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
Subject: Re: [RFC PATCH v5 2/3] riscv: Introduce custom CSR hooks to
 riscv_csrrw()
Message-ID: <YXJ3lEChs9bSkqSZ@ruinland-x1c>
References: <20211021150921.721630-1-ruinland@andestech.com>
 <20211021150921.721630-3-ruinland@andestech.com>
 <cdafb564-6ed8-c951-9381-3a90175abdde@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cdafb564-6ed8-c951-9381-3a90175abdde@linaro.org>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
X-Originating-IP: [192.168.21.142]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 19M8YVOk000178
Received-SPF: pass client-ip=60.248.187.195;
 envelope-from=ruinland@andestech.com; helo=ATCSQR.andestech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 22 Oct 2021 08:41:47 -0000

On Thu, Oct 21, 2021 at 05:08:09PM -0700, Richard Henderson wrote:
> On 10/21/21 8:09 AM, Ruinland Chuan-Tzu Tsai wrote:
> > riscv_csrrw() will be called by CSR handling helpers, which is the
> > most suitable place for checking wheter a custom CSR is being accessed.
> > 
> > If we're touching a custom CSR, invoke the registered handlers.
> > 
> > Signed-off-by: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
> > ---
> >   target/riscv/cpu.c             | 19 +++++++++++++++++
> >   target/riscv/cpu.h             | 13 +++++++++++-
> >   target/riscv/csr.c             | 38 +++++++++++++++++++++++++++-------
> >   target/riscv/custom_csr_defs.h |  7 +++++++
> >   4 files changed, 68 insertions(+), 9 deletions(-)
> >   create mode 100644 target/riscv/custom_csr_defs.h
> > 
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 0c93b7edd7..a72fd32f01 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -34,6 +34,9 @@
> >   static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
> > +GHashTable *custom_csr_map = NULL;
> 
> Leftover from a previous revision?

By default there's no custom_csr_map (pointing to NULL) and thus only the
custom CSR equipped CPU models will need to initialize that. Standard CPU will
pass the check of custom_csr_map in riscv_csrrw() by default.

> 
> > +#include "custom_csr_defs.h"
> 
> I think that the few declarations that are required can just go in internals.h.

Wilco.

> 
> > +
> >   const char * const riscv_int_regnames[] = {
> >     "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
> >     "x7/t2",   "x8/s0",  "x9/s1",  "x10/a0", "x11/a1", "x12/a2",  "x13/a3",
> > @@ -149,6 +152,22 @@ static void set_resetvec(CPURISCVState *env, target_ulong resetvec)
> >   #endif
> >   }
> > +static void setup_custom_csr(CPURISCVState *env,
> > +                             riscv_custom_csr_operations csr_map_struct[])
> 
> Why is this static?  Surely it needs to be called from csr_andes.c, etc?
> Oh, I see that in the next patch you call this directly from ax25_cpu_init.
> 
> I think the split of declarations is less than ideal.  See below.
> 
> > +{
> > +    int i;
> > +    env->custom_csr_map = g_hash_table_new(g_direct_hash, g_direct_equal);
> > +    for (i = 0; i < MAX_CUSTOM_CSR_NUM; i++) {
> 
> Having a hard maximum seems a mistake.  You should pass in the array size...
> 
> > +        if (csr_map_struct[i].csrno != 0) {
> > +            g_hash_table_insert(env->custom_csr_map,
> > +                GINT_TO_POINTER(csr_map_struct[i].csrno),
> > +                &csr_map_struct[i].csr_opset);
> > +        } else {
> > +            break;
> > +        }
> 
> ... which would also allow you to remove the terminator in the data, and the check here.

Wilco.

> 
> > @@ -245,6 +245,11 @@ struct CPURISCVState {
> >       /* Fields from here on are preserved across CPU reset. */
> >       QEMUTimer *timer; /* Internal timer */
> > +
> > +    /* Custom CSR opset table per hart */
> > +    GHashTable *custom_csr_map;
> 
> I think placing this in the CPURISCVState is incorrect.  A much better place
> would be on the RISCVCPUClass, so that there is exactly one copy of this per
> cpu type, i.e. all A25/AX25 cpus would share the same table.
> 
> You would of course need to hook class_init, which the current definition of
> DEFINE_CPU does not allow.  But that's easy to fix.
> 
> > +    /* Custom CSR value holder per hart */
> > +    void *custom_csr_val;
> >   };
> 
> Value singular?  Anyhow, I think that it's a mistake trying to hide the
> value structure in another file.  It complicates allocation of the
> CPURISCVState, and you have no mechanism by which to migrate the csr values.

What I'm trying to do here is to provide a hook for CSR value storage and let
it being set during CPU initilization. We have heterogeneous harts which
have different sets of CSRs.

> 
> I think you should simply place your structure here in CPURISCVState.
> 
> > +static gpointer find_custom_csr(CPURISCVState *env, int csrno)
> > +{
> > +    gpointer ret;
> > +    ret = g_hash_table_lookup(env->custom_csr_map, GINT_TO_POINTER(csrno));
> > +    return ret;
> > +}
> 
> Fix the return type; the csr is not gpointer.
> It would be better to put the map not null test here.
> 
> I think it would be even better to name this find_csr,
> and include the normal index of csr_ops[] if the map
> test fails.

Wilco.

> 
> > @@ -1449,26 +1458,39 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
> >           return RISCV_EXCP_ILLEGAL_INST;
> >       }
> > +    /* try to handle_custom_csr */
> > +    if (unlikely(env->custom_csr_map != NULL)) {
> > +        riscv_csr_operations *custom_csr_opset = (riscv_csr_operations *)
> > +            find_custom_csr(env, csrno);
> > +        if (custom_csr_opset != NULL) {
> > +            csr_op = custom_csr_opset;
> > +            } else {
> > +            csr_op = &csr_ops[csrno];
> > +            }
> > +        } else {
> > +        csr_op = &csr_ops[csrno];
> > +        }
> 
> As Alistair noted, run checkpatch.pl to find all of these indentation errors.
> 
> That said, a better structure here would be
> 
>     csr_op = find_csr(env, csrno);
>     if (csr_op == NULL) {
>         return RISCV_EXCP_ILLEGAL_INST;
>     }

Thanks for the tips. Wilco.
> 
> 
> r~

Cordially yours,
Ruinland

