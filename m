Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oH0xd-00068y-QO
	for mharc-qemu-riscv@gnu.org; Thu, 28 Jul 2022 06:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@fluff.org>)
 id 1oH0xV-00060n-9J; Thu, 28 Jul 2022 06:41:37 -0400
Received: from test-v6.fluff.org ([2a01:4f8:222:2004::3]:36764
 helo=hetzy.fluff.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@fluff.org>)
 id 1oH0xS-0007BU-PK; Thu, 28 Jul 2022 06:41:36 -0400
Received: from ben by hetzy.fluff.org with local (Exim 4.89)
 (envelope-from <ben@fluff.org>)
 id 1oH0xN-0007FI-GV; Thu, 28 Jul 2022 11:41:29 +0100
Date: Thu, 28 Jul 2022 11:41:29 +0100
From: Ben Dooks <qemu@ben.fluff.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Ben Dooks <qemu@ben.fluff.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v3 1/5] device_tree: add qemu_fdt_setprop_strings() helper
Message-ID: <20220728104129.gfbxpf4stnv5v6wa@hetzy.fluff.org>
References: <20220727223905.624285-1-qemu@ben.fluff.org>
 <20220727223905.624285-2-qemu@ben.fluff.org>
 <20220728092227.m2v6nyy4eblcreo2@kamzik>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220728092227.m2v6nyy4eblcreo2@kamzik>
X-Disclaimer: These are my views alone.
X-URL: http://www.fluff.org/
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: ben@fluff.org
X-SA-Exim-Scanned: No (on hetzy.fluff.org); SAEximRunCond expanded to false
Received-SPF: pass client-ip=2a01:4f8:222:2004::3; envelope-from=ben@fluff.org;
 helo=hetzy.fluff.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 28 Jul 2022 10:41:37 -0000

On Thu, Jul 28, 2022 at 11:22:27AM +0200, Andrew Jones wrote:
> On Wed, Jul 27, 2022 at 11:39:01PM +0100, Ben Dooks wrote:
> > Add a helper to set a property from a set of strings
> > to reduce the following code:
> > 
> >     static const char * const clint_compat[2] = {
> >         "sifive,clint0", "riscv,clint0"
> >     };
> > 
> >     qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
> >         (char **)&clint_compat, ARRAY_SIZE(clint_compat));
> > 
> > Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
> > ---
> > v3;
> >  - fix return value for the call
> >  - add better help text
> > v2:
> >  - fix node/path in comment
> > ---
> >  include/sysemu/device_tree.h | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> > 
> > diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> > index ef060a9759..83bdfe390e 100644
> > --- a/include/sysemu/device_tree.h
> > +++ b/include/sysemu/device_tree.h
> > @@ -87,6 +87,25 @@ int qemu_fdt_setprop_string(void *fdt, const char *node_path,
> >  int qemu_fdt_setprop_string_array(void *fdt, const char *node_path,
> >                                    const char *prop, char **array, int len);
> >  
> > +/**
> > + * qemu_fdt_setprop_strings: set a property from a set of strings
> > + *
> > + * @fdt: pointer to the dt blob
> > + * @path: node name
> > + * @prop: property array
> > + *
> > + * This is a helper for the qemu_fdt_setprop_string_array() function
> > + * which takes a va-arg set of strings instead of having to setup a
> > + * single use string array.
> > + */
> > +#define qemu_fdt_setprop_strings(fdt, path, prop, ...)          \
> > +    ({ int __ret; do {                                          \
> > +        static const char * const __strs[] = { __VA_ARGS__ };   \
> > +        __ret = qemu_fdt_setprop_string_array(fdt, path, prop,  \
> > +                (char **)&__strs, ARRAY_SIZE(__strs));          \
> > +     } while(0); __ret; })
> 
> The do { } while (0) shouldn't be necessary inside the ({}), but I
> think we should change the places that are checking the return value
> of qemu_fdt_setprop_string_array() to not check the return value,
> because it will always be zero. qemu_fdt_setprop_string_array() calls
> qemu_fdt_setprop() which exits QEMU on error. Then, after there are
> no callers checking the return value we can change this macro to

I think I did this due to the hw/ppc changes that /do/ check the
return code but are different enough to not be trivially changable.

I'll go back and make this the original do {} while() tongith and
post a v4 for people to look. The hw/ppc stuff can stay as is for
now.

Thank you for the review.

-- 
Ben Dooks, ben@fluff.org, http://www.fluff.org/ben/

Large Hadron Colada: A large Pina Colada that makes the universe disappear.


